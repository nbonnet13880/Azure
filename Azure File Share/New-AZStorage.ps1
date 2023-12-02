#https://learn.microsoft.com/fr-fr/azure/storage/files/storage-how-to-create-file-share?tabs=azure-powershell
connect-azaccount
Set-AzContext "9e408de3-3baa-419d-9c7e-37d9a44eb071"

#Create Storage Subscription
$RGName = "Infrastructure"
$StorageAccountName = "soleam"
$region = "westeurope"

$storAcct = New-AzStorageAccount `
    -ResourceGroupName $RGName `
    -Name $StorageAccountName `
    -SkuName Standard_LRS `
    -Location $region `
    -Kind StorageV2 `
    -EnableLargeFileShare

    Set-AzStorageAccount -ResourceGroupName $RGName -Name $StorageAccountName -EnableLargeFileShare

    #Create partage
    $shareName = "testsoleam"

New-AzRmStorageShare -ResourceGroupName $RGName -StorageAccountName $StorageAccountName -Name $shareName -AccessTier TransactionOptimized -QuotaGiB 1024 | Out-Null