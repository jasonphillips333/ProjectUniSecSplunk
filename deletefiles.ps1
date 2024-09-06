# Empty the Recycle Bin
$Recycler = (New-Object -ComObject Shell.Application).NameSpace(0xa)
$Recycler.items() | Remove-Item -Force

# Clear Temporary Files
$TempFolders = @("C:\Windows\Temp", "C:\Users\*.*\AppData\Local\Temp")
$TempFolders | ForEach-Object { Remove-Item -Path $_ -Force -Recurse }

# Clean Up Disk Using Cleanmgr
Cleanmgr /SAGESET:6 /VERYCLEAN /MOUNTEDDISKS

# (Optional) Remove Hibernation File
if (Test-Path -Path C:\Hiberfil.sys) {
  Remove-Item -Path C:\Hiberfil.sys -Force
}

# (Optional) Remove System Restore Points (except most recent)
$allRestorePoints = Get-RestorePoint
$allRestorePoints | Where-Object { $_.CreationDate -lt (Get-Date).AddDays(-7) } | Remove-RestorePoint

# Display Free Space Before and After
$drive = Get-Partition -DriveLetter C
$freeSpaceBefore = "{0:N0}" -f $drive.FreeAvailable
Write-Host "Free space before cleanup: $freeSpaceBefore Bytes"

# Refresh drive information after cleanup
$drive = Get-Partition -DriveLetter C
$freeSpaceAfter = "{0:N0}" -f $drive.FreeAvailable
Write-Host "Free space after cleanup: $freeSpaceAfter Bytes"

Write-Host "Successfully cleaned up HDD space!"