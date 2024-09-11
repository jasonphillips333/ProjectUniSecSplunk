# ==================================================
# System Change password  
#
# Author: Jason Phillips
# Date Created: September 2024
#
# Description:
# [Change password for local account ]
# ==================================================

$newPassword = Read-Host -AsSecureString "Enter new password:"
$confirmPassword = Read-Host -AsSecureString "Confirm new password:"

if ($newPassword -eq $confirmPassword) {
    Set-ADAccount -Identity $env:USERNAME -NewPassword $newPassword
    Write-Host "Password changed successfully!"
} else {
    Write-Host "Passwords do not match."
}

