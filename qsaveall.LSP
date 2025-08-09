;;;; Quick-Save All
;;;;
(defun c:qsaveall()
  (progn 
   (setq start_time (getvar "MILLISECS"))      ;Start-Time from Current System Time
   (c:SaveAll) ;Syntax for the AutoLISP Extension function
   (setq end_time (getvar "MILLISECS"))        ;End-Time from Current System Time
   (setq elapsed_time (- end_time start_time)) ;(end_time - start_time) = elapsed_time
   (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))
  );;End Progn ;^ realNumber to String, 2=decimalMode 0=precision
 )
