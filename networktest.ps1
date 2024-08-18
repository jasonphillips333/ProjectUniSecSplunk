# ==================================================
# System Network test Scan Program
#
# Author: Jason Phillips
# Date Created: September 2024
#
# Description:
#   [Network test can be used alone or part of splunk triggers]
# ==================================================


# Get network adapter information
$adapters = Get-NetAdapter

foreach ($adapter in $adapters) {
    Write-Host "Adapter: $($adapter.Name)"
    Write-Host "Link Speed: $($adapter.LinkSpeed)"
}

# Ping a website
$pingResult = Test-Connection google.com -Count 4 -BufferSize 32768
Write-Host "Average Ping: $($pingResult.ResponseTime.Average) ms"

# Basic file transfer test (for demonstration purposes)
$sourceFile = "C:\LargeFile.txt"
$destinationFile = "D:\LargeFile.txt"
$timeTaken = Measure-Command { Copy-Item $sourceFile $destinationFile }
$fileSize = (Get-Item $sourceFile).Length
$transferSpeed = $fileSize / $timeTaken.TotalSeconds
Write-Host "Transfer Speed: $($transferSpeed) bytes/second"
