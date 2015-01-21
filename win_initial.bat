@echo on

REM Title Windowws Initial Provisinoing Script
REM Date 2015/01/19
REM Scripted by asasaki4github

systeminfo > C:\systeminfo_result.txt
ipconfig > C:¥ifconfig_result.txt

REM Change ExecutionPolicy to RemoteSigned
powershell Set-ExecutionPolicy RemoteSigned
powershell Get-ChildItem > C:\Get-ChildItem.txt

REM Execute PowerShell File (.ps1)
powershell https://raw.githubusercontent.com/asasaki4github/ProvisioningScript/master/win_initial_setup.ps1

REM Change ExecutionPolicy to Restricted