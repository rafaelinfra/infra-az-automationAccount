Connect-AzAccount

#verificar qual o contexto é o atual
Get-AzContext

#Verificar quais as subscriptions existentes
Get-AzSubscription

#Mude para a Subscription que você utiliza o automation account
Set-AzContext -subscription <ID-DA-SUBSCRIPTION>

##### Gere um PAT no Azure DevOps #######

#Converta o PAT em SecureString
$convertPat = convertto-securestring "<Insera o PAT>" -asplaintext -force


#execute o comando abaixo
New-AzAutomationSourceControl `
	-Name <nomedoSourceControl> `
	-RepoUrl https://dev.azure.com/<accountname>/<adoprojectname>/_git/<repositoryname> `
	-SourceType VsoGit `
	-AccessToken $password `
	-Branch <BranchUtilizada> `
	-ResourceGroupName <ResourceGroup> `
	-AutomationAccountName <AutomationAccount> `
	-FolderPath "/Runbooks"