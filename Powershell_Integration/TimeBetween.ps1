## Tired of Doing TimeSpan Math in my Head
$userStr = Read-Host -Prompt "When did we arrive?     (ie 8:30:00) " #Get user input 1
$userEnd = Read-Host -Prompt "When will we leave?     (ie 4:30pm or 16:30) " #Get user input 2

$startDaTime = Get-Date $userStr
$endDateTime = Get-Date $userEnd

$timeSpan = New-Time-Span -Start $startDaTime -End $endSateTime
Write-Host "Time Difference (Hours):   $($timeSpan.Hours)"
Write-Host "Time Difference (Minutes): $($timeSpan.Minutes)"
