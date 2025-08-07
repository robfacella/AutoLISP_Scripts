$totalSeconds = $($args[0])	#Set time to wait from command line args
$currentCount = $totalSeconds	#Countdown from, preserving $totalSenconds args if needed later.

while ($currentCount -gt 0){
    Write-Host "$currentCount seconds remaining..."
    Start-Sleep -Seconds 1	#Sleep for 1 second
    $currentCount--		#decrease counter by 1
}				#Do While greater than 0

Write-Host "Time's up!"		#Could be the end, but write a Complete_Flag_Temp File Somewhere to scan for...
New-Item -Path "C:/Users/RFacella/Documents/Dev/powershell_complete.flag" -ItemType File -Force
