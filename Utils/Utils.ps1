Connect-AzAccount 
Get-AzSubscription | Format-Table -GroupBy Name
Write-Host "Please select the Subscription ID who the Azure ressource must be created" -ForegroundColor Green
$Subscription = $name= Read-Host -Prompt "Enter your Subscription Id"
Set-AzContext $Subscription