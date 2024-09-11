1..254 |ForEach-Object{
$ip= "192.168.$_"
if (Test-Connection -ComputerName $ip -Count 1 -Quiet)
	 {
		Write-Host  "$ip is online
	}
	else{
		Write-Host  "$ip is offline
	}
}