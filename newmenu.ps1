PowerShell
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$form = New-Object System.Windows.Forms.Form
$form.Text   
 = "My PowerShell Menu"
$form.Size = New-Object System.Drawing.Size(300, 200)

$button1 = New-Object System.Windows.Forms.Button
$button1.Text = "Option 1"
$button1.Location = New-Object System.Drawing.Point(100, 50)
$button1.Add_Click({Write-Host "Option 1 clicked"})

$button2 = New-Object System.Windows.Forms.Button
$button2.Text = "Option 2"
$button2.Location = New-Object System.Drawing.Point(100, 100)
$button2.Add_Click({Write-Host "Option 2 clicked"})

$form.Controls.Add($button1)
$form.Controls.Add($button2)

$form.ShowDialog()