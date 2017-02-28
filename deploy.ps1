$creds = Get-Credential
$tenant_id = "ebe3bffb-c025-4a3a-94ee-4560ee30cc9b"

Add-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId $tenant_id

New-AzureRmResourceGroup -Name WAPRG01 -Location eastus2

Test-AzureRmResourceGroupDeployment -ResourceGroupName WAPRG01 -TemplateFile c:\users\jonguz\Chef\azuredeploy.json -TemplateParameterFile C:\Users\jonguz\Chef\azuredeploy.parameters.json -Debug

New-AzureRmResourceGroupDeployment -Name WAPRG01Deployment -ResourceGroupName WAPRG01 -TemplateUri https://raw.githubusercontent.com/jogule/chef_azure/master/azuredeploy.json -TemplateParameterUri https://raw.githubusercontent.com/jogule/chef_azure/master/azuredeploy.parameters.json -Debug

New-AzureRmResourceGroupDeployment -Name WAPRG01Deployment -ResourceGroupName WAPRG01 -TemplateFile c:\users\jonguz\Chef\azuredeploy.json -TemplateParameterFile https://raw.githubusercontent.com/jogule/chef_azure/master/azuredeploy.parameters.json -Debug



Remove-AzureRmResourceGroup -Name WAPRG01 -Force

Get-AzureRmVMImagePublisher -Location eastus2

Get-AzureRmVMImageOffer -Location eastus2 -PublisherName MicrosoftSQLServer
Get-AzureRmVMImageSku -Location eastus2 -PublisherName MicrosoftSQLServer -Offer SQL2014SP2-WS2012R2 | select skus | foreach { Write-Host ("`"{0}`"," -f $_.Skus) }
Get-AzureRmVMImage -Location eastus2 -PublisherName MicrosoftSQLServer -Offer SQL2014SP2-WS2012R2 -Skus Enterprise
Get-AzureRmVMImage -Location eastus2 -PublisherName MicrosoftSQLServer -Offer SQL2014SP2-WS2012R2 -Skus Enterprise -Version 4.0.20170111


Get-AzureRmVMImageOffer -Location eastus2 -PublisherName Canonical
Get-AzureRmVMImageSku -Location eastus2 -PublisherName Canonical -Offer UbuntuServer | select skus | foreach { Write-Host ("`"{0}`"," -f $_.Skus) }
Get-AzureRmVMImage -Location eastus2 -PublisherName Canonical -Offer UbuntuServer -Skus 14.04.2-LTS
Get-AzureRmVMImage -Location eastus2 -PublisherName Canonical -Offer UbuntuServer -Skus 14.04.2-LTS -Version 4.0.20170111

Get-AzureRmVMSize -Location eastus2 | select name | foreach { Write-Host ("`"{0}`"," -f $_.name) }