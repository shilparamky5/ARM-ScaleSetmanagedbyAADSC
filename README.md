
VM Scale Set Configuration managed by Azure Automation

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmgreenegit%2FARM-ScaleSetmanagedbyAADSC%2Fmaster%2Fazuredeploy.json)


[![Build status](https://ci.appveyor.com/api/projects/status/4l7qavifq3v5ei7p?svg=true)](https://ci.appveyor.com/project/mgreenegit/arm-scalesetmanagedbyaadsc)

This repo serves to prove an ARM template to deploy a VM Scale Set where virtual machines are deployed as registered nodes in the Azure Automation Desired State Configuration service, and node configuration is guaranteed consistency after deployment.

# From Git Shell
    
	git clone https://github.com/mgreenegit/ARM-ScaleSetmanagedbyAADSC
    
# From Azure PowerShell
This commands assumes you want to either create a new Resource Group named "TestScaleSet0001", or deploy in to an existing Resource Group by that name.
    
	Login-AzureRmAccount
	New-AzureRmResourcegroup -Name TestScaleSets0001 -Location 'East US' -Verbose
	New-AzureRmResourceGroupDeployment -Name TestScaleSets0001 -ResourceGroupName TestScaleSets0001 -TemplateParameterFile .\azuredeploy.parameters.json -TemplateFile .\azuredeploy.json -instanceCount 10 -Verbose
	
# To remove registered nodes after testing is complete
Replace with values for your account.  The resource group in this case refers to the Azure Automation instance.

	Login-AzureRmAccount
	Get-AzureRMAutomationDSCNode -ResourceGroupName 'YOUR_RG_HERE' -AutomationAccountName 'YOUR_ACCOUNT_NAME_HERE' | ? Name -like YOUR_NAME_PATTERN_HERE-* | Unregister-AzureRmAutomationDscNode -Force

# Prior Examples

[VM DSC Extension Azure Automation Pull Server](https://github.com/Azure/azure-quickstart-templates/tree/master/dsc-extension-azure-automation-pullserver)<br>
[Deployment of Multiple VM Scale Sets of Windows VMs](https://github.com/Azure/azure-quickstart-templates/tree/02d32850258f5b172266896e498e30e8e526080a/301-multi-vmss-windows)