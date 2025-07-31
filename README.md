# azure-data-engineering

Designing and implementing data engineering solutions in the Azure ecosystem.

***

### Requirements

Create a [Microsoft Azure account](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account/search?ef_id=_k_EAIaIQobChMImPu25uDnjgMVonR_AB36uTt-EAAYASAAEgLPIPD_BwE_k_&OCID=AIDcmmfq865whp_SEM__k_EAIaIQobChMImPu25uDnjgMVonR_AB36uTt-EAAYASAAEgLPIPD_BwE_k_&gad_source=1&gad_campaignid=22826911111&gclid=EAIaIQobChMImPu25uDnjgMVonR_AB36uTt-EAAYASAAEgLPIPD_BwE)

Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
[Authenticate Terraform to Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash)

***

### Project Setup

The Terraform configurations in this project refer to a number of environment variables which store account details.
Create a terraform.tfvars file in the Terraform root module (just inside the terraform folder) containing the values below.
Ensure that tfvars files are in the .gitignore file.  

Azure Data Factory can be configured to connect to a git provider, allowing you to save and version control ADF configurations. 
This requires the following attributes as referenced in /terraform/adf.tf:

- adf_github_account_name="accountname" --> This is the name of the GitHub account that should be associated with the ADF instance. Replace accountname with your desired account.
- adf_github_repo="repository-name" --> This is the repo associated with the ADF instance. Replace repository-name with your desired repo.
- adf_github_url="https://github.com/accountname/repository-name.git" --> This is the URL for the above repo. Replace the URL with the URL for your desired repo. 

### Post-Deployment Setup

Once deployed, there is still some manual configuration that needs to be done.  

- Navigate to your Azure Data Factory instance and complete the git authentication process. 