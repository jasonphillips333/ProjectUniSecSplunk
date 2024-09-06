Get-NetAdapterStatistics -Name "WI-FI"
Get-NetAdapterStatistics -Name "RTVM"

iperf3.exe -c 192.168.0.165

Get-NetAdapter | Select-Object Name, Speed