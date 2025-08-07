(progn  ;;Testing Running Powershell from Lisp
  (setq flagFile "C:/Users/RFacella/Documents/Dev/powershell_complete.flag") ;;Same as used by ./Countdown_X.ps1 ;;Should probably Relative-Path things like this.
  (vl-file-delete flagFile)                     ;; Delete the flag File if it already exists from a prior run.
  (princ "\nWhy are you running?!")
  (progn ;; Run Powershell Script, wait for it @ 0.1 second increments until the flag file is created, then continue
        (startapp "C:/Windows/system32/WindowsPowerShell/v1.0/powershell.exe" "-File C:/Users/RFacella/Documents/Dev/powershell_complete.flag 24") ;;25 would've been funnier
        (while (not (findfile flagFile))        ;; *WARNING - Too Short of a delay could cause CPU to seize!*
            (command "DELAY" 100)               ;; Pause for 100 miliseconds.
        )                                       ;; Loop and check for file again.
        (vl-file-delete flagFile)               ;; Optional - Cleanup by deleting the flagFile on the fly
        (princ "\nPowerShell script finished.") ;; That's Powershell done'
  )
)
