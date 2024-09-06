$ComputerMemory = Get-WmiObject Win32_OperatingSystem

$TotalMemoryMB = ($ComputerMemory.TotalVisibleMemorySize / 1MB)
$UsedMemoryMB = (($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory) / 1MB)
$FreeMemoryMB = ($ComputerMemory.FreePhysicalMemory / 1MB)

$PercentUsed = [math]::Round(($UsedMemoryMB / $TotalMemoryMB) * 100, 2)

Write-Output "Total Memory: $($TotalMemoryMB:N0) MB"
Write-Output "Used Memory: $($UsedMemoryMB:N0) MB"
Write-Output "Free Memory: $($FreeMemoryMB:N0) MB"
Write-Output "Memory Used Percentage: $PercentUsed%"