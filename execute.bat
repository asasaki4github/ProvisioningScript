@echo on

REM Title Windowws Initial Provisinoing Script
REM Date 2015/01/19
REM Scripted by asasaki4github

systeminfo > C:\systeminfo_result.txt

REM Change ExecutionPolicy to RemoteSigned
powershell Set-ExecutionPolicy RemoteSigned

REM Execute PowerShell File (.ps1)
powershell http://www.example.com/MyScript/testps.ps1

REM Change ExecutionPolicy to Restricted
powershell Set-ExecutionPolicy Restricted
