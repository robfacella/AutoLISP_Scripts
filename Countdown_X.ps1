$totalSeconds = 10
$currentCount = $totalSeconds

while ($currentCount -gt 0){
    Write-Host "$currentCount seconds remaining..."
    Start-Sleep -Seconds 1
    $currentCount--
}

Write-Host "Time's up!"
