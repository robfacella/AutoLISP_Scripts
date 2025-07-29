;;; qsave all
(defun c:QSARB() ;; Quick SaveAll Reboot
  (progn 
   (progn
     (setq sleepSecBeforeRB "10")
     (setq temp (getint (strcat "\nHow long to sleep prior to reboot? ")))
     (if (= temp)
       (setq sleepSecBeforeRB (itoa temp)))
   );;End User Entry Progn
   (setq start_time (getvar "MILLISECS")) ;;Start-Time
   (progn ;; Save-All and Time Stamp
     (command "saveall")
   
     (setq end_time (getvar "MILLISECS")) ;;End Time
     (setq elapsed_time (- end_time start_time))
    
     (princ (strcat "\nTime to save-all: " (rtos elapsed_time 2 0) " milliseconds"))
   );;End Save-ALL
   (progn ;;Close-All Others
;;toDo
   );;End Close Others
   (progn ;;Launch Reboot and Close Local
;;ToDo
     (setq elapsed_time (- end_time start_time))
     (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))
   );;End RB
  );;End Progn
 );; End QSARB
