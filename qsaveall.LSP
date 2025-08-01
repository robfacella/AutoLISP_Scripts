;;; qsave all
(defun c:qsaveall()
  (progn 
   (setq start_time (getvar "MILLISECS")) ;;Start-Time

   (c:SaveAll) ;;Syntax for the AutoLISP extension function
   
   (setq end_time (getvar "MILLISECS")) ;;End Time
   (setq elapsed_time (- end_time start_time))

   (princ (strcat "\nCode execution time: " (rtos elapsed_time 2 0) " milliseconds"))

  );;End Progn
 )
