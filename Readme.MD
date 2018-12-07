# Deploy Win10 from store and execute custom script

The template demonstrates the three methods to execute a script in a VM using the custom
script extension. 
1. inline, using a base64 encoded script.
2. download, using a public location.
3. download, using a storage account with its key to access it. 

The public location is coded in the template to use the GitHub repo and will just work. To use the storage account you have some additional steps, including a change in the template (sorry):
* create the storage account.
* create a container in the BLOB storage called `scripts`.
* upload the script `Enable-WinRM.ps1` from the GitHub repo to this container.
* fork this GitHub repo. 
* change the storage accounts paths in `azuredeploy.json` for parameter `scriptLocation`. You need the toplevel (excluding the `scripts` level) URLs to the scripts in your own repo and your storage account. 
* optionally change parameter `storageAccountName` as well.
* if you want to use the **deploy** button below, that URL needs changing too. 

Research note: I have briefly tried to use a SAS key to download the script from the storage account, but did not succeed. I suspect that this is not supported. 

The current template uses a Win10 VM because one particular customer needed this. However, it should work the same with Windows Server versions. 

One-click deployment to Azure:

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwkasdorp%2Fwin10-poc%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Warning: this template **creates one running VM**. Make sure to deallocate it 
when you are done to avoid incurring costs. 

Original template [A Visual Studio Development VM](https://github.com/Azure/azure-quickstart-templates/blob/master/visual-studio-dev-vm/azuredeploy.json)