# terraform-azure
All the tf configuration files created while learning terraform

> About downloading terraform binaries and adding destination to the environment path in windows.
1) Go to https://www.terraform.io/downloads and download the relavant binary file.
2) No installation is needed. Just create a folder and move the binary to this folder.
3) Go to the environment variables and add above folder to the path variable. Post which u should be able to execute the terraform command.

> about .ssh folder and need for keys. Procedure to generate keys using ssh key-gen from putty or GITBASH
1) Create a folder (Say Project/) where all the terraform configuration files will be present. Create a ".ssh" folder in the main folder (say Projects/.ssh) and store the ssh keys in the .ssh folder (Say Projects/.ssh/id_rsa).
2) This ssh key will be used to create the instances and later using the keys we can ssh the instance.
3) Follow the link to generate the ssh keys using GIT Bash
https://docs.joyent.com/public-cloud/getting-started/ssh-keys/generating-an-ssh-key-manually/manually-generating-your-ssh-key-in-windows

> About loggin in to azure from power shell using az login.
1) Go to the powershell and execute the following command to install the Azure CLI

$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

2) Refer to the following link for more information
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-powershell

3) After installing the Azure CLI execute the command "az login" in powershell. Command will re-direct to the Browser and will prompt for login credentials. After the login, Powershell shall gain the authorization to execute the CLI (or terraform scripts)

> What the codes in repository will do after execution.
1) The configuration files in the repository will create an instance with a public IP and private IP. 
2) Security groups will be attached to the Interface and ports like 80,443,22 etc will be allowed. 
3) NGINX server will be installed and index.html will be displayed upon accessing the public IP from any browser.

> Information about parameters (defaaults and tfvars), what can be changed. 
Following variables can be customized by changing the values in the "terraform.tfvars" file
1) IP address range used for assigning Private IP address
2) Version of the Ubuntu (16.04 or 18.04)
3) Variable "isfree" when made TRUE will use free size "Standard_B1s". When made false, will use the size "Standard_F2"
4) Port numbers mentioned in the variable "nsg_inbound_ports_list" will be allowed on the instance.