;;;; Quick-Save All, Reboot
;;;; but do the User Defined Sleep prior to the Save-All attempt, then reboot shortly thereafter.
(defun c:QSARB()
  (progn ;;Main
   (progn ;; Establish Path for Flag File
     (setq flagFile "C:/Users/RFacella/Documents/Dev/powershell_complete.flag") ;;Same as used by ./Countdown_X.ps1 ;;Should probably Relative-Path things like this.
     (vl-file-delete flagFile)                                                  ;; Delete the flag File if it already exists from a prior run.
   )
   (progn ;;User Input
     (setq temp (getint (strcat "\nHow long to sleep prior to reboot? ")))
     (if (= temp)
       (setq sleepSecBeforeRB (itoa temp))) ;Need error handling for getint
   );;End User Entry Progn
   (progn ;; Sleep For
      (startapp "C:/Windows/system32/WindowsPowerShell/v1.0/powershell.exe" (strcat "-File C:/Users/RFacella/Documents/Dev/Countdown_X.ps1 " sleepSecBeforeRB))
      (while (not (findfile flagFile))        ;; *WARNING - Too Short of a delay could cause CPU to seize!*
          (command "DELAY" 100)               ;; Pause for 100 miliseconds.
      )                                       ;; Loop and check for file again.
      (vl-file-delete flagFile)               ;; Optional - Cleanup by deleting the flagFile on the fly
   )
   (setq start_time (getvar "MILLISECS")) ;Start-Time from SystemClock
   (progn ;; Save-All & Time Stamp
     (c:SaveAll) ;Syntax for the AutoLISP Extension function
     (setq end_time (getvar "MILLISECS")) ;End-Time from SystemClock
     (setq elapsed_time (- end_time start_time)) ; elapsed=(end-start)
     (princ (strcat "\nSaved-All in: " (rtos elapsed_time 2 0) " milliseconds")) ;decMode, 0digit
   );;End Save-ALL
   (progn ;;Close-All Others
      (command "CLOSEALLOTHER") ; Do this Before Closing Host Drawing
   );;End Close-Others ; If host Drawing Closes before launching Reboot the Script stops running itself too.
   (progn ;;Launch Reboot & Close Local Host dwg
     (setq RBTack (strcat "/r /t " sleepSecBeforeRB)) ;Combine Args for [Reboot] [Time Delay of _]
     (setq RBTack (strcat "/r /t " "15")) ;Combine Args for [Reboot] [Time Delay of _]
     (startapp "shutdown.exe" RBTack) ;Launch Windows Reboot
     (setq elapsed_time (- end_time start_time)) ;(below) print in decMode, 0digit
     (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))
     (command "CLOSE");;Finally Close Host Drawing
   );;End RB
  );;End Main Progn
);; End QSARB
