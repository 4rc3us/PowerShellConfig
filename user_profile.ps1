# Prompt
Invoke-Expression (&starship init powershell)

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Github Module
#Import-Module PSGitHub

#$PSDefaultParameterValues['*GitHub*:Token'] = $env:GHTOKEN | ConvertTo-SecureString

# PSReadLine
Set-PSReadLineOption -EditMode vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -HistoryNoDuplicates
#Remove-PSReadLineKeyHandler -Chord Alt+1
#Remove-PSReadLineKeyHandler -Chord Alt+2
#Remove-PSReadLineKeyHandler -Chord Alt+3
Remove-PSReadLineKeyHandler -Chord Ctrl+v
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Chord 'alt+l' -Function ForwardWord
Set-PSReadLineKeyHandler -Chord 'alt+h' -Function BackwardWord
Set-PSReadlineKeyHandler -Chord 'Ctrl+x' -Function DeleteChar
Set-PSReadlineKeyHandler -Chord 'Ctrl+u' -Function DeleteLine
Set-PSReadlineKeyHandler -Chord 'Ctrl+w' -Function DeleteWord
Set-PSReadlineKeyHandler -Chord 'Ctrl+e' -Function EndOfLine
Set-PSReadlineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' -PSReadlineChordSetLocation 'Alt+c'

# Docker Module
Import-Module DockerCompletion

# Git Module
Import-Module posh-git

# Alias
Remove-Alias -Name ls
Remove-Alias -Name pwd
Set-Alias g git
Set-Alias grep findstr
Set-Alias x 'C:\Windows\explorer.exe'
Set-Alias lg lazygit
Set-Alias ld lazydocker
Set-Alias python3 python
Set-Alias -Name .. -Value "cd.."
Set-Alias -Name wl-copy -Value clip
#Set-Alias -Name npm -Value pnpm
Set-Alias -Name ls -Value eza

function v ()
{ nvim @args
}
function pipx ()
{ python3 -m pipx @args
}
function l ()
{ eza --icons=always --no-quotes --classify=always -G -a @args
}
function ll ()
{ eza --icons=always --no-quotes --classify=always -G -a -l @args
}

function which ($command)
{ Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function pwd ()
{ Get-Location | Select-Object -ExpandProperty Path
}

function vd ()
{ python.exe '$USERPROFILE\Miniconda3\Scripts\vd'
}

function bgn ()
{ Start-Process -NoNewWindow -RedirectStandardOutput "NUL" @args
}
function bg ()
{ Start-Process -NoNewWindow @args
}
function erdi ()
{ erd -s name -I -y inverted --hidden --no-git @args
}
function erdf ()
{ erd  -s name -C none -y flat
}
function pingt ()
{ ping 8.8.8.8 -t
}

#function pushall
#{ git remote | ForEach-Object {git push $_ --all} }

# function TEST() {
# 	$data = @{
# 		"key1" = "value1"
# 		"key2" = "value2"
# 	}
# 	while ($true) {
# 		$response = Invoke-WebRequest -Uri "http://localhost:7080/" -Method Post -Body $data
# 		Write-Output $response.Content
# 		Start-Sleep -Seconds 1
# 	}
# }

###############
# Completions #
###############

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
	param($commandName, $wordToComplete, $cursorPosition)
	dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
	}
}

#Setup erd completions
#. "$env:USERPROFILE\Documents\PowerShell\erd.ps1"

#SETUP JAVA
#$env:JAVA_HOME = "$env:USERPROFILE\.sdkman\candidates\java\current"
#$env:PATH += ";$env:JAVA_HOME\bin"

