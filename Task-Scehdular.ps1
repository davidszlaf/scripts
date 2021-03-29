param ([String]$TaskName, [int]$WaitSeconds)
$registerTaskParameters = @{
    TaskName  =  $TaskName
    }
Function Create-Task (){
$ScheduledTaskcreation = @{
    Execute  = "pwsh.exe"
    Argument = "-File C:\Users\david\Desktop\Sela_Files\Week2\Scripts\mytask.ps1"
}
$Action = New-ScheduledTaskAction 
    -Execute 'pwsh.exe'
    -Argument '-NonInteractive -NoLogo -NoProfile -File "C:\Users\david\Desktop\Sela_Files\Week2\Scripts\mytask.ps1"'
$trigger = New-ScheduledTaskTrigger
     -Once 
     -At (Get-Date)
     -RepetitionInterval (New-TimeSpan -Minutes 1)
}

Function Change-TaskStatus (){
    if( (Get-ScheduledTask | Where TaskName -eq $TaskName ).State -eq "Ready"){
            Disable-ScheduledTask -TaskName $TaskName}
        else{
            Enable-ScheduledTask -TaskName $TaskName
            }
}

echo "Task will run for $WaitSeconds seconds."
Change-TaskStatus 
Get-ScheduledTask | Select-Object TaskName