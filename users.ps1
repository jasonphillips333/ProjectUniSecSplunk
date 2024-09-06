# Get all users (or specific user using -ObjectId parameter)
$users = Get-AzureADUser -All $true

# Create an empty array to store user license information
$userLicenses = @()

# Loop through each user
foreach ($user in $users) {
  # Get assigned licenses for the user
  $licenses = $user.AssignedLicenses

  # If the user has licenses
  if ($licenses) {
    # Loop through each assigned license
    foreach ($license in $licenses) {
      # Get the SKU ID
      $skuId = $license.SkuId

      # Get the corresponding license name using Get-AzureADSubscribedSku
      $skuInfo = Get-AzureADSubscribedSku -Filter "SkuId eq '$skuId'"

      # Check if SKU information is found (may not exist for all SKUs)
      if ($skuInfo) {
        # Create an object to store user and license details
        $userLicense = New-Object PSObject -Property @{
          "UserPrincipalName" = $user.UserPrincipalName
          "DisplayName" = $user.DisplayName
          "SkuId" = $skuId
          "LicenseName" = $skuInfo.SkuPartNumber
        }
      } else {
        # If SKU info not found, create with only user and SKU ID
        $userLicense = New-Object PSObject -Property @{
          "UserPrincipalName" = $user.UserPrincipalName
          "DisplayName" = $user.DisplayName
          "SkuId" = $skuId
          "LicenseName" = "Unknown (SKU not found)"
        }
      }

      # Add the user license object to the userLicenses array
      $userLicenses += $userLicense
    }
  }
}

# Export the user license information to a CSV file
$userLicenses | Export-Csv -Path "user_licenses.csv" -NoTypeInformation

# Display success message
Write-Host "User license information exported to user_licenses.csv"