;;;; Quick-Save All, Reboot
(defun c:QSARB()
  (progn ;;Main
   (progn ;;User Input
     (setq temp (getint (strcat "\nHow long to sleep prior to reboot? ")))
     (if (= temp)
       (setq sleepSecBeforeRB (itoa temp))) ;Need error handling for getint
   );;End User Entry Progn
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
     (startapp "shutdown.exe" RBTack) ;Launch Windows Reboot
     (setq elapsed_time (- end_time start_time)) ;(below) print in decMode, 0digit
     (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))
     (command "CLOSE");;Finally Close Host Drawing
   );;End RB
  );;End Main Progn
);; End QSARB
