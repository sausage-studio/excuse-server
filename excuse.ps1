$routerAddress = "towel.blinkenlights.nl"
$port = "666"
$tcp = New-Object System.Net.Sockets.TcpClient($routerAddress,$Port)
$tcpstream = $tcp.GetStream()
$reader = New-Object System.IO.StreamReader($tcpStream)
$writer = New-Object System.IO.StreamWriter($tcpStream)
$writer.AutoFlush = $true
write-host ([char]$reader.Read()) -NoNewline
while(($reader.Peek() -ne -1) -or ($tcp.Available)){        
    $a = $a + ([char]$reader.Read())
}
$tcp.Close()  
$reader.Close()
$writer.Close()
echo $a > $env:temp\exfil.out
