;;; qsave all
(defun c:QSARB() ;; Quick SaveAll Reboot
  (progn ;;Main
   (progn ;;User Input
     (setq sleepSecBeforeRB "10")
     (setq temp (getint (strcat "\nHow long to sleep prior to reboot? ")))
     (if (= temp)
       (setq sleepSecBeforeRB (itoa temp))) ;; need error handling still
   );;End User Entry Progn
   (setq start_time (getvar "MILLISECS")) ;;Start-Time
   (progn ;; Save-All and Time Stamp
     (c:SaveAll) ;;Syntax for the AutoLISP extension function
     (setq end_time (getvar "MILLISECS")) ;;End Time
     (setq elapsed_time (- end_time start_time))
    
     (princ (strcat "\nTime to save-all: " (rtos elapsed_time 2 0) " milliseconds")) ;;wysiwyg
   );;End Save-ALL
   (progn ;;Close-All Others
      (command "CLOSEALLOTHER") ;; Do this Before Closing Host Drawing
   );;End Close Others
   (progn ;;Launch Reboot and Close Local
     (setq RBTack (strcat "/r /t " sleepSecBeforeRB)) ;;Combine Arguements for [Reboot] [Time Delay of ____]
     (startapp "shutdown.exe" RBTack) ;;Launch Windows Reboot
     (setq elapsed_time (- end_time start_time))
     (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))
     (command "CLOSE");;Finally Close Host Drawing
   );;End RB
  );;End Main Progn
);; End QSARB
