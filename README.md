
# Example ARM Template - VM Scale Set Configuration with Azure Automation

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmgreenegit%2FARM-ScaleSetmanagedbyAADSC%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

This repo serves to prove an ARM template to deploy a VM Scale Set where virtual machines are deployed as registered nodes in the Azure Automation Desired State Configuration service, and node configuration is guaranteed consistency after deployment.

# From Git Shell
    
	git clone https://github.com/mgreenegit/ARM-ScaleSetmanagedbyAADSC
    
# From Azure PowerShell
This commands assumes you want to either create a new Resource Group named "TestScaleSet0001", or deploy in to an existing Resource Group by that name.
    
	Login-AzureRmAccount
	New-AzureRmResourcegroup -Name TestScaleSets0001 -Location 'East US' -Verbose
	New-AzureRmResourceGroupDeployment -Name TestScaleSets0001 -ResourceGroupName TestScaleSets0001 -TemplateParameterFile .\azuredeploy.parameters.json -TemplateFile .\azuredeploy.json -instanceCount 10 -Verbose