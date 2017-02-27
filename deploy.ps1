$creds = Get-Credential
$tenant_id = "ebe3bffb-c025-4a3a-94ee-4560ee30cc9b"

Add-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId $tenant_id

New-AzureRmResourceGroup -Name WAPRG01 -Location eastus2

Test-AzureRmResourceGroupDeployment -ResourceGroupName WAPRG01 -TemplateFile c:\users\jonguz\Chef\azuredeploy.json -TemplateParameterFile C:\Users\jonguz\Chef\azuredeploy.parameters.json

New-AzureRmResourceGroupDeployment -Name WAPRG01Deployment -ResourceGroupName WAPRG01 -TemplateFile c:\users\jonguz\Chef\azuredeploy.json -TemplateParameterFile c:\users\jonguz\Chef\azuredeploy.parameters.json

Get-AzureRm | FT -Property DisplayName

Get-AzureRmVMImagePublisher -Location eastus2

Get-AzureRmVMImageOffer -Location eastus2 -PublisherName MicrosoftWindowsServer