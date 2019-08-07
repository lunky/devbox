<#
    Start Windows PowerShell with the "Run as Administrator" option. Only members of the Administrators group on the computer can change the execution policy.
    Enable running unsigned scripts by entering:
    `set-executionpolicy remotesigned`
	This will allow running unsigned scripts that you write on your local computer and signed scripts from Internet.
#>

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	"You must run this script as an admin"
	pause
	exit
}

"Installing chocolatey"
set-executionpolicy bypass -scope process -force; iex ((new-object system.net.webclient).downloadstring('https://chocolatey.org/install.ps1'))

"Installing applications"
choco install googlechrome
#choco install jdk8
choco install git
choco install nodejs
choco install yarn
#choco install slack
#choco install datagrip
#choco install intellijidea-ultimate
choco install postman
choco install 7zip.install
# choco install microsoft-teams
choco install notepadplusplus
choco install vim 
choco install stack
choco install ghc

"Installing and setting up vscode"
choco install vscode
choco install vscode-gitlens
choco install vscode-eslint

"Installing and setting up docker"
choco install docker-desktop
docker run -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 --name mysql -d mysql

"Complete set up"
pause
exit
