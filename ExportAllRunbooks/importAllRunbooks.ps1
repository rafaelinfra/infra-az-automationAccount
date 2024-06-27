$ResourceG = "<Nome do Grupo de Recurso>"
$aaName = "<nome da Automation Account>"

$Runbooks = Get-AzAutomationRunbook -AutomationAccountName $aaName -ResourceGroupName $ResourceG

foreach($runbook in $Runbooks){
    Export-AzAutomationRunbook -ResourceGroupName $ResourceG -AutomationAccountName $aaName -Name $runbook.Name -Slot "Published" -OutputFolder "<Caminho local onde os scripts vão ser salvos>"
}