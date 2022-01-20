# terraform-azure
All the tf configuration files created while learning terraform

> About downloading terraform binaries and adding destination to the environment path in windows
Go to https://www.terraform.io/downloads and download the relavant binary file.
No installation is needed. Just create a folder and move the binary to this folder.
Go to the environment variables and add above folder to the path variable. Post which u should be able to execute the terraform command.

> about .ssh folder and need for keys. Procedure to generate keys using ssh key-gen from putty or GITBASH
Create a folder (Say Project/) where all the terraform configuration files will be present. Create a ".ssh" folder in the main folder (say Projects/.ssh) and store the ssh keys in the .ssh folder (Say Projects/.ssh/id_rsa).
This ssh key will be used to create the instances and later using the keys we can ssh the instance.
Follow the link to generate the ssh keys using GIT Bash
https://docs.joyent.com/public-cloud/getting-started/ssh-keys/generating-an-ssh-key-manually/manually-generating-your-ssh-key-in-windows

> About loggin in to azure from power shell using az login.
Go to the powershell and execute the following command to install the Azure CLI

$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

Refer to the following link for more information
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-powershell

After installing the Azure CLI execute the command "az login" in powershell. Command will re-direct to the Browser and will prompt for login credentials. After the login, Powershell shall gain the authorization to execute the CLI (or terraform scripts)

> What the codes in repository will do after execution.
The configuration files in the repository will create an instance with a public IP and private IP. Security groups will be attached to the Interface and ports like 80,443,22 etc will be allowed. NGINX server will be installed and index.html will be displayed upon accessing the public IP from any browser.

> Information about parameters (defaaults and tfvars), what can be changed. 
Following variables can be customized by changing the values in the "terraform.tfvars" file
a) IP address range used for assigning Private IP address
b) Version of the Ubuntu (16.04 or 18.04)
c) Variable "isfree" when made TRUE will use free size "Standard_B1s". When made false, will use the size "Standard_F2"
d) Port numbers mentioned in the variable "nsg_inbound_ports_list" will be allowed on the instance.