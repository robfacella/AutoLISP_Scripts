$totalSeconds = $($args[0])		#Set time to wait from command line args
$currentCount = [int]$totalSeconds	#Countdown from int value of totalSeconds. (args was fine, but AutoLisp didn't like String of Int being passed here)

while ($currentCount -gt 0){
    Write-Host "$currentCount seconds remaining..."
    Start-Sleep -Seconds 1	#Sleep for 1 second
    $currentCount--		#decrease counter by 1
}				#Do While greater than 0

Write-Host "Time's up!"		#Could be the end, but write a Complete_Flag_Temp File Somewhere to scan for...
New-Item -Path "C:/Users/RFacella/Documents/Dev/powershell_complete.flag" -ItemType File -Force
