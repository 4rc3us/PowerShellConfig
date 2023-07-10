# Prompt
#Import-Module posh-git
#Import-Module oh-my-posh
#Set-PoshPrompt avit
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\avit.omp.json" | Invoke-Expression
Invoke-Expression (&starship init powershell)

# Icons
# Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Remove-PSReadLineKeyHandler -Chord Alt+1
Remove-PSReadLineKeyHandler -Chord Alt+2
Remove-PSReadLineKeyHandler -Chord Alt+3
Set-PSReadLineKeyHandler -Chord 'alt+l' -Function ForwardWord
Set-PSReadLineKeyHandler -Chord 'alt+h' -Function BackwardWord
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias l ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
#Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias x 'C:\Windows\explorer.exe .'
Set-Alias lg lazygit
Set-Alias lv lvim
Set-Alias python3 python
Set-Alias lvim "$env:USERPROFILE\.local\bin\lvim.ps1"

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function ws () { Set-Location ~/workspace/ }
function vd () { python.exe 'C:\Users\Juan.arce\Miniconda3\Scripts\vd' }
function bgn () { Start-Process -NoNewWindow -RedirectStandardOutput "NUL" @args }
function bg () { Start-Process -NoNewWindow @args }

function killF () { C:\Windows\system32\wsl.exe --terminate fedoraremix }

function purge {
	param([string]$path = $pwd)

	$lineasUnicas = Get-Content $path | Select-Object -Unique

	$lineasUnicas | Out-File -FilePath $path
}

function erds () {
	erd  -s name -C none -y flat | bat
}

function pingt () { ping 8.8.8.8 -t }

function gffs () { git flow feature start @args }

function gfff () { git flow feature finish @args }

<# function ssh-passwd () {
	$empty = "The agent has no identities."
	$answer = ssh-add -l

	if ($answer -eq $empty) { sh-add $HOME\.ssh\id_ed25519 }
} #>

Invoke-Expression (& { (zoxide init powershell | Out-String) })
