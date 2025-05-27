;;; Bottom of Curb, Top of Curb, Points (x,y,z) appended to CSV from Line Segments
(defun c:BCTCAppend()
 ;; Select a Line Segment
 (setq e(entget(car(entsel))))
 ;(princ)
 (princ "\n")
 (princ "Start Point:  ")
 ; 10 is address of the list which stores the X Y Z of a Line's start point
 (princ cdr (assoc 10 e)))
 (princ "\n")
 (princ "End Point:  ")
 ; 11 is address of the list which stores the X Y Z of a Line's end point
 (princ cdr (assoc 11 e)))
 (princ "\n")

 ; Choose a file to Append Data to; Rename, move, or delete between sessions.
 (setq f (open "C:\\Users\robfacella\Documents\Dev\Example.csv" "a"))
 (princ "\n")

 ;; Create a CSV line for Start and End points; adding BC or TC 

);EoF

;; RTOS List to String
;; Concatenates each String after recasting a supplied list of REAL Varriables, separated by a delimeter parameter
;; lst - [lst] List of REALs to Convert and Concatenate.
;; del - [str] Delimeter string to separate each item.
(defun c:lst2str ( lst del )
 (if (cdr lst)
  ;(strcat (car list) del (c:lst2str (cdr lst) del));if rtos wasn't needed here
  (strcat (rtos(car list)) del (c:lst2str (cdr lst) del))
  ;(car lst);if rtos not needed
  (rtos(car lst))
 );endIF
);EoF
