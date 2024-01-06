#https://learn.microsoft.com/fr-fr/azure/storage/files/storage-how-to-create-file-share?tabs=azure-powershell
#Variable Create Storage Subscription
$RGName = "Infrastructure"
$StorageAccountName = "inyourcloud"
$region = "westeurope"
$shareName = "docssociete"

#Module AZ nécessaire
. ..\Utils\Utils.ps1


$storAcct = New-AzStorageAccount `
    -ResourceGroupName $RGName `
    -Name $StorageAccountName `
    -SkuName Standard_LRS `
    -Location $region `
    -Kind StorageV2 `
    -EnableLargeFileShare

Set-AzStorageAccount -ResourceGroupName $RGName -Name $StorageAccountName -EnableLargeFileShare

Write-Host "The creation of the storage account is in progess. The system wait 30 secondes before to create the file share." -ForegroundColor Green
start-sleep 30

New-AzRmStorageShare -ResourceGroupName $RGName -StorageAccountName $StorageAccountName -Name $shareName -AccessTier TransactionOptimized -QuotaGiB 1024 | Out-Null