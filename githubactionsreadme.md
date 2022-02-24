Had to create Azure Storgae account with a container to save Terrform State file manually i.e Powershell.
Terraform Plan yml  added to the github workflow to deply infra
Terraform Apply added yml to the github workflow to deply infra
webapp yml was added to the github workflow to build & deploy the code into the app service created by Terraform.
The CI ids configred to trigger on the Main or the feature branchrs
Build Stage and Deploy Stage created within the same yaml worklfow
Api key should be configured as a secure string in secrets in the Github Repo
Build & Deployment yaml pipelines can be found in Pipelines folder of the solution

**Note**:  Azure App Service - Free tier does not support deployment using GitHub Worklfow because it needs Deployment slots. This can be done any tier above Shared Tier
