# Prompt
#Import-Module posh-git
#Import-Module oh-my-posh
#Set-PoshPrompt avit
#####oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\avit.omp.json" | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Remove-PSReadLineKeyHandler -Chord Alt+1
Remove-PSReadLineKeyHandler -Chord Alt+2
Remove-PSReadLineKeyHandler -Chord Alt+3

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias l ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias x 'C:\Windows\explorer.exe .'
Set-Alias lg lazygit
Set-Alias lv lvim

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function bgn () {Start-Process -NoNewWindow -RedirectStandardOutput "NUL" @args}
function bg () {Start-Process -NoNewWindow @args}

function killP () {C:\Windows\system32\wsl.exe --terminate podman-machine-default}
function killU () {C:\Windows\system32\wsl.exe --terminate Ubuntu-20.04}

function ssh-passwd () {
	$empty = "The agent has no identities."
	$answer = ssh-add -l

	if ($answer -eq $empty)
	{
		ssh-add $HOME\.ssh\id_ed25519
	}
}

ssh-passwd