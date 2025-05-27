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

