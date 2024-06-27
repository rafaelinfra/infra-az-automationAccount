### Necessário logar no azure #####


$userOne = "xxxxxxxxxxxxxxx" #Usuário existente como Owner no Grupo

$useradd = "xxxxxxxxxxxxxxx" #Usuário para adicionar

$filtergroup = az ad group list --filter "startswith(displayname, '<inicio do nome do grupo>')" --query '[].{Name:displayName}' --output tsv

foreach ($group in $filtergroup){
    $idDefault = az ad group owner list --group $group --query '[].{ID:id}' --output tsv
    if ($idDefault -match $userOne){
        az ad group owner add --group $group --owner-object-id $useradd
        Write-Output "Usuário incluido no grupo: $group"
    }
}
