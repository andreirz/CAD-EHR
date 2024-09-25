(defun RtD (r) (* 180.0 (/ r pi)))
(defun DtR (d) (* pi (/ d 180.0)))

(defun BITS_LST	(num / n lst)
   (setq n 0)
   (while (<= (expt 2 n) num)
      (setq n (1+ n))
   )
   (while (< 0 n)
      (setq n (1- n))
      (if (= (logand num (expt 2 n)) (expt 2 n))
	 (setq lst (cons (expt 2 n) lst))
      )
   )
   lst
)

(defun -MEMBER (mbr lst )
   (reverse (member mbr (reverse lst))))

(defun -MEMBER_ASSOC (assoc_i lst / rev)
   (setq rev (reverse lst))
   (reverse (member (assoc assoc_i rev) rev))
)

(defun DICTAD (dict key_val / pair)

  (if (not dict)
    (setq dict '())
  )
  (foreach kv key_val
    (setq key (car kv)
	  val (cdr kv)
    )
    (if	(/= (type val) 'LIST)
      (setq val (list val))
    )

    (setq pair (assoc key dict))
    (if	pair
      (setq
	dict (subst (cons (car pair) (append (cdr pair) val))
		    pair
		    dict
	     )
      )

      (setq dict (append dict (list (cons key val))))
    )
  )
  dict
)

(defun LM:flatten_pts ( l )
    (if (vl-every 'atom l)
        (list l)
        (append (LM:flatten_pts (car l)) (if (cdr l) (LM:flatten_pts (cdr l))))
    )
)


(defun LST->STR_SEP (lst sep / d res)
   (if (null sep)
      (setq sep "")
   )
   (setq res "")
   (foreach d lst
      (setq res	(strcat	res
			(VL-PRINC-TO-STRING d)
			sep
		)
      )
   )

   (vl-string-right-trim sep res)
)

(defun pt3D->2D (pt)
  (list (car pt ) (cadr pt) ))

(defun ARCSIN (sinus /)
   (if (numberp sinus)
      (cond
	 ((= sinus 1) (/ pi 2.0))
	 ((= sinus -1) (/ pi -2.0))
	 ((<= -1 sinus 1)	  
	  (atan (/ sinus (sqrt (- 1.0 (* sinus sinus)))))
	 )
      )
   )
)

(defun CHRD->ARC_LEN (chrd_len rad)
   (* 2
      rad
      (ARCSIN (/ chrd_len (* 2 rad)))
   )
)

(defun CHRD->ANG (chrd_len rad)
   (setq arc_len (* 2
      rad
      (ARCSIN (/ chrd_len (* 2 rad)))
   ))
   (/ arc_len rad)
)


(defun STRBETWEEN ( prfx sfx string)
(cadr (SPARSER (car (SPARSER  string  sfx )) prfx ))

)

(defun STR_REMOVE (string remove_lst)
   (foreach str	remove_lst
      (setq string (vl-string-subst "" str string))
   )
   string
)
(defun SPARSER (str delim / ptr lst)
  (while (setq ptr (vl-string-search delim str))
    (setq lst (cons (substr str 1 ptr) lst))
    (setq str (substr str (+ ptr (1+ (strlen delim)))))
  )
  (reverse (cons str lst))
)

(defun LST_SLICE (start end lst / c e res)
  (if (> 0 start)
    (setq start (+ (length lst) start))
    (setq start (1- start))

  )
  (if (>= 0 end)
    (setq end (+ (length lst) end))

  )
  (setq res nil)

  (setq c 0)
  (foreach e lst
    (if	(< start c end)
      (setq res (append res (list e)))
    )
    (setq c (1+ c))
  )
  res
)


(defun LST_REM_DUPES (lst / x)
  (setq lst (reverse lst))
  (foreach x lst
    (setq lst (vl-remove x lst))
    (setq lst (cons x lst))
  )
)
(defun PT->STR (pt prec)   
   (VL-PRINC-TO-STRING (mapcar '(lambda (x) (rtos x 2 prec)) pt) )
)
(defun STR->PT (pt )
   (read pt)
)
(defun PTS_REM_DUPLI (ptslst prec / pt )
  (setq ptslst (mapcar '(lambda (pt) (PT->STR pt prec))
		       ptslst))
 (mapcar 'read (LST_REM_DUPES ptslst))
)

(defun -CDR (lst)
  (reverse (cdr (reverse lst))))

(defun PLINE_COORDS_GET	(pline / crds)
  (setq crds (if (= 'VLA-OBJECT (type pline))
    (mapcar '(lambda (x)
	       (if (= 2 (length x))
		 (append x (list 0.0))
	       )
	     )
	    (LM:GROUP<N (vlax-get pline 'Coordinates) 2)
    )
    (mapcar 'cdr
	    (vl-remove-if-not
	      '(lambda (x) (= 10 (car x)))
	      (entget pline)
	    )
    )

  ))
   
)

(defun LM:group<n (lst n / a b m)
  (while lst
    (setq m n)
    (while (and lst (< 0 m))
      (setq a	(cons (car lst) a)
	    lst	(cdr lst)
	    m	(1- m)
      )
    )
    (setq b (cons (reverse a) b)
	  a nil
    )
  )
  (reverse b)
)


(defun LISTSPLIT_BY_ELM_FUN (ELM_DEFINING_TEST_FUN lst / lst_all lst_part el)
   (setq lst_all '())
   (setq lst_part '())
   (foreach el lst
      (if (null lst_all)
	 (setq lst_part (append lst_part (list el)))
      )
      (cond ((apply ELM_DEFINING_TEST_FUN (list el))
	     (setq lst_all (append lst_all (list lst_part)))
	     (setq lst_part '())
	    )
	    ((= el (last lst))
	     (setq lst_part (append lst_part (list el)))
	     (setq lst_all (append lst_all (list lst_part)))
	    )
	)
      (setq lst_part (append lst_part (list el)))
      
   )
   (if (= 1 (length (car lst_all)))
      (cdr lst_all)
      lst_all
   )
      
)

(defun SS2LST (ss / e lst i)
  (if (/= 0 (SSLENGTH ss))
    (repeat (setq i (SSLENGTH ss))
      (setq e (ssname ss (setq i (1- i))))
      (setq lst (cons e lst))
    )
  )
  lst
)

;;-------------------------------TEST--------------------------------------

(defun MAKE_LAYER (lname props / f f_dx existing)
  (if (setq f_dx (assoc 70 props))
    (progn
      (setq f (cdr f_dx))
      (setq props (vl-remove f_dx props))
    )

    (setq f 0)
  )
  (setq existing (tblobjname "layer" lname))

  (if (null existing)
    (entmakex
      (vl-remove nil
                 (append
                   (list (cons 0 "LAYER")
                         (cons 100 "AcDbSymbolTableRecord")
                         (cons 100 "AcDbLayerTableRecord")
                         (cons 2 lname)
                         (cons 70 f)  ;frozen

                   )
                         props
                 )
      )
    )
    existing
  )
)

(defun PLINE_MAKE (point-list bulge-list props)
    ;closed
  (if (null bulge-list)
    (repeat (LENGTH point-list)
      (setq bulge-list (cons 0.0 bulge-list))
    )
  )
  (if (null props)
    (setq props '())
  )
  (entmakex
    (apply 'append
           (list
             (list

               '(0 . "LWPOLYLINE")
               '(100 . "AcDbEntity")
               '(100 . "AcDbPolyline")
               ;'(6 . "Continuos")
               ;'(48 . 1); Ltscale
               ;'(8 . "0")
               ;'(62 . 3)  ;color
               ;'(67 . 0)
               ;'(70 . 0)  ;closed

               (CONS 90 (LENGTH point-list))
             )
                 props
                 (apply 'append
                        (MAPCAR '(LAMBDA (a b) (list (CONS 10 a) (CONS 42 b))) point-list bulge-list)
                 )


           )
    )
  )
)
(setq *seg_len_RZ 1.5)
(setq *sep_RZ " ")
(setq *row_RZ "")
(setq *prec_RZ 2)
(setq *allow_duplicates "N")

(defun C:EHR_SETTINGS ()
   (setq lst '("Precision" "ChordLength" "AllowDuplicateCoords"))
   (initget (LST->STR_SEP lst " "))
   (setq kw (GETKWORD (strcat "\nSettings[" (LST->STR_SEP lst "/") "]:")))
   (cond ((= "Precision" kw)
	  (setq	*prec_RZ
		  (getint (strcat "\nNumber of digits <" (itoa *prec_RZ) ">:")
		  )
	  )
	 )
	 ((= "ChordLength" kw)
	  (setq	*seg_len_RZ
		  (getreal (strcat "\nChord length <" (rtos *seg_len_RZ 2 *PREC_RZ) ">:")
		  )
	  )
	 )
	 ((= "AllowDuplicateCoords" kw)
	  (initget "Y N")
	  (setq	*allow_duplicates
		  (getkword (strcat "\nAllow duplicates in coordinate files [Yes/No]<" *allow_duplicates ">:")
		  )
	  )
	 )

   )
   (princ)
)

(defun ARC->SEGS (cen rad a_start a_end ccw dist / a_crt a_delta a_i pts n);;
   (setq a_delta (- a_end a_start))
   (if (minusp a_delta)
      (setq a_delta (+ (* 2 pi) a_delta))
   )
   (setq pts '())
   (if (<= dist (* 2 rad))
      (progn
	 (setq a_i (CHRD->ANG dist rad))
	 (setq n (fix (/ a_delta a_i)))
	 (setq a_crt a_start)
	 
	 (repeat (+ 1 n)
	    (setq pts (append pts (list (polar cen (* ccw a_crt) rad))))
	    (setq a_crt (+ a_crt a_i))
	 )
	 (setq pts (append pts (list (polar cen (* ccw a_end) rad))))
	 
      )

      (setq pts	(list (polar cen (* ccw a_start) rad)
		      (polar cen (* ccw a_end) rad)
		)
      )

      
   )		    ; end IF dist < arc_length

pts 
		    ;pts

)






(defun LM:BULGE->ARC (p1 p2 b / c r)
   (setq r (/ (* (distance p1 p2) (1+ (* b b))) 4 b)
	 c (polar p1 (+ (angle p1 p2) (- (/ pi 2) (* 2 (atan b)))) r)
   )
   (if (minusp b)
      (list c (angle c p2) (angle c p1) (abs r))
      (list c (angle c p1) (angle c p2) (abs r))
   )
)





(defun HATCH->SEGS (ent /	  ccw	     cen	h_crds_section
		       h_crds_shapes	     h_dx	h_type	   p1
		       p2	  pl_crds    pts	pts_res	   rad
		    
		      )
   (setq h_dx (entget ent))
   ;(cdr (assoc 93 h_dx));; nr ents
   
   ;(setq h_dx_rev (reverse h_dx))
   (setq h_crds_section
	   (member (assoc 72 h_dx);; first shape
		   (-MEMBER_ASSOC 97 h_dx));;last shapes group
   )
   
(setq h_type (BITS_LST (cdr (assoc 92 h_dx))))
(setq pts_res '())	
   (if (member 2 h_type); is PLINE
      (progn
	 (setq pl_crds (vl-remove-if-not
			  '(lambda (i) (member (car i) '(10 42)))
			  h_crds_section
		       )
	 )

	 (setq
	    pts_res (append pts_res (list (PLINE_DATA->SEGS pl_crds  )))
	 )
      )		    ; end PROGN is pline

      (progn
	 (setq h_crds_shapes
		 (LISTSPLIT_BY_ELM_FUN
		    '(lambda (el) (= 72 (car el)))
		    h_crds_section
		 )
	 )
	
	 (foreach shp h_crds_shapes
	    
	    (cond ((= 1 (cdr (assoc 72 shp)))

		   (setq p1 (cdr (assoc 10 shp)))
		   (setq p2 (cdr (assoc 11 shp)))

		   (if (not (equal p1 p2 10e-6))		      
		      (setq pts_res (append pts_res (list (list p1 p2))))
		   )
		  ) ; end CASE LINE
		  ((= 2 (cdr (assoc 72 shp)))
		   (setq rad (cdr (assoc 40 shp)))
		   (setq cen (cdr (assoc 10 shp)))
		   (setq ccw (if (= 0 (cdr (assoc 73 shp)))
				-1
				1
			     )
		   )

		   (setq pts (ARC->SEGS
				cen
				rad
				(cdr (assoc 50 shp))
				(cdr (assoc 51 shp))
				ccw
				*seg_len_RZ
			     )
		   )
		   (setq pts_res (append pts_res (list pts)))
		 
		  ) ; end CASE ARC


	    )	    ;end COND
	    
	    
	 ); end LOOP each shape
	 
      ); end PROGN not pline
      
   ); enf IF  pline


pts_res

)




(defun ENT->SEGS_RZ (e / e_dx e_typ pts pl_crds closed)
  (setq e_dx (entget e)
        e_typ (cdr (assoc 0 e_dx))
  )
  (setq pts
    (cond
      ((= "HATCH" e_typ)
          (HATCH->SEGS e)
      )
      ((= "LWPOLYLINE" e_typ)
          (setq pl_crds (vl-remove-if-not
                          '(lambda (i) (member (car i) '(10 42)))
                          e_dx
                        )
          )
;;;         (setq closed (if (= 0 (cdr (assoc 70 e_dx)))
;;;	       0      1)
;;;	 )
         (list (PLINE_DATA->SEGS pl_crds ))
      )
      ((= "LINE" e_typ)
          (list (list (cdr (assoc 10 e_dx))
                      (cdr (assoc 11 e_dx))
                )
          )
      )
      ((= "ARC" e_typ)
          (list (ARC_E->SEGS e))
      )
    )
  )
  (vl-remove nil pts)

)



;(setq arc (car(entsel)))
(defun ARC_E->SEGS (arc / a_dx pts)
  (setq a_dx (entget arc))
  (setq pts (ARC->SEGS
              (cdr (assoc 10 a_dx))
              (cdr (assoc 40 a_dx))
              (cdr (assoc 50 a_dx))
              (cdr (assoc 51 a_dx))
              1
              *seg_len_RZ
            )
  )
		    ;(PLINE_MAKE pts nil '((62 . 120)))
  pts
)

(defun PLINE_DATA->SEGS (pts_b_lst / b e p0 p1 p2 p2_0 pts pts_b_lst1 res)

   (defun BULGE_DATA->PTS_SEGS (p1 p2 b / bulge_data res) 
     (setq bulge_data
	     (LM:BULGE->ARC p1 p2 b)
     )
     (setq res (ARC->SEGS
	(nth 0 bulge_data) ;center
	(nth 3 bulge_data) ;radius
	(nth 1 bulge_data) ;start a
	(nth 2 bulge_data) ; end a
	1	    ; CCW
	*seg_len_RZ
     ))
      (cdr (-CDR res))
  )
   
   (setq pts_b_lst1 pts_b_lst)
   (setq p0 (cdr (assoc 10 pts_b_lst)))
   (setq res (list p0))
   (while (setq e (car pts_b_lst1))
      (cond ((and (= 10 (car e))
		  (not (equal (cdr e) (car res)))
	     )
	     (setq res (append res (list (cdr e))))
	    )
	    ((and (= 42 (car e))
		  (/= 0 (setq b (cdr e)))
	     )
	     (setq p1 (last res))
	     (setq p2 (if (setq p2_0 (nth 1 pts_b_lst1))
			 (cdr p2_0)
			 p0
		      )
	     )
	     (setq pts (BULGE_DATA->PTS_SEGS p1 p2 b))
	     (setq pts (if (minusp b)
			  (reverse pts)
			  pts
		       )
	     )
	     (setq res (append res
			       pts

		       )
	     )
	    )
      )
      (setq pts_b_lst1 (cdr pts_b_lst1))
   )

   (vl-remove nil res)
)



(defun WRITE_COORDS_RZ (lyr_coords_data / base_path crds_data path print_data file pt x)
		    ;(setq lyr_coords_data (ENTS_BY_LAYER->YX_COORDS (SS->ENTS_BY_LAYER)))
   (setq base_path (DWG_NAME->NEW_DIR_N)
   )
   (setq dupli (if (= "Y" *allow_duplicates)
				  "_original"
				  ""
			       ))
   (foreach data lyr_coords_data
		    ;(setq data (nth 2 lyr_coords_data))
      
      (setq path (strcat base_path "\\" (car data) dupli ".txt"))
      (setq print_data (cdr (-CDR data)))
      
;;;      (if (FINDFILE path)
;;;	 (VL-FILE-DELETE path))
      (setq file (open path "a"))
      
      (princ (car print_data) file)
      (foreach line (cdr print_data)
	 (if line
	 (princ (strcat "\n" line) file)
	    )
      )
      
      (close file)
   )
   t
)

(defun ENTS_BY_LAYER->YX_COORDS	(ents_by_lyr / crds_0 crds_yx e pt res)
		    ;(setq ents_by_lyr (SS->ENTS_BY_LAYER))

   (defun CRDS_YX->PRINT (crds_yx / e_data_print pt res x)
      (setq res '())
      (foreach e_data crds_YX
		    ;(setq e_data (nth 0 crds_YX))
	 (setq e_data_print
		 (append (mapcar

			    '(lambda (pt)
				(LST->STR_SEP
				   (mapcar '(lambda (x) (rtos x 2 *prec_RZ)) pt)
				   *sep_rz
				)
			     )
			    e_data
			 )
			 (list *row_RZ)
		 )
	 )
	 (setq res (append res e_data_print))

      )
      
      res
   )

   
   (setq res '())
   (foreach lyr_grp ents_by_lyr
		    ;(setq lyr_grp (nth 0 ents_by_lyr))
;;;      (setq crds_0 (LM:FLATTEN_PTS
;;;		      (mapcar '(lambda (e) (ENT->SEGS_RZ e)) (cdr lyr_grp))
;;;		   )
;;;      )
      (setq crds_0 (mapcar '(lambda (e / pts)
			       (setq pts (LM:FLATTEN_PTS (ENT->SEGS_RZ e)))
			       (if (= "N" *allow_duplicates)
				  (PTS_REM_DUPLI pts *prec_rz)
				  pts
			       )
			    )
			   (cdr lyr_grp)
		   )
      )

      
      (setq crds_YX (mapcar '(lambda (e) (mapcar '(lambda (pt) (reverse (PT3D->2D pt))) e)) crds_0))
      ;(print (cdr (assoc 5 (entget e))))
      (setq res	(append	res
			(list (cons (car lyr_grp)
				   (CRDS_YX->PRINT crds_YX)
			      )
			)
		)
      )
   )
   res
)


(defun SS->ENTS_BY_LAYER (/ e ents ents_by_layer ss)
   (and
      (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE,HATCH")
			(-4 . "<NOT")
			(8 . "TEST_COORDS")
			(-4 . "NOT>")

		       )
	       )
      )
      (setq ents (SS2LST ss))
      (setq ents_by_layer
	      (DICTAD
		 nil
		 (mapcar '(lambda (e) (cons (cdr (assoc 8 (entget e))) e))
			 ents
		 )
	      )
      )      
   )
   ents_by_layer   
   )

(defun DWG_NAME->NEW_DIR_N (/ crt dirs dir_path dwg_name)
   (setq dwg_name (STR_REMOVE (VL-FILENAME-BASE (GETVAR 'DWGname)) '("(" ")")))
   (setq crt (if (setq dirs (vl-directory-files
			       (GETVAR 'DWGPrefix)
			       (strcat dwg_name "(*)")
			       -1
			    )
		 )
		(+ 1 (atoi (STRBETWEEN "(" ")" (car (vl-sort dirs '>)))))
		1
	     )
   )

   (setq dir_path (strcat (GETVAR 'DWGPrefix)
			  dwg_name
			  "("
			  (itoa crt)
			  ")"
		  )
   )
   (if
      (vl-mkdir dir_path)
	dir_path
   )
)


(defun C:EHR_WRITE ()
   (if (and
	  (setq ents_by_layer (SS->ENTS_BY_LAYER))
	  (setq yx_coords_lsts (ENTS_BY_LAYER->YX_COORDS ents_by_layer))
	  
	  (WRITE_COORDS_RZ yx_coords_lsts)
       )
      (princ (strcat "\nCoordonates for " (itoa (apply '+ (mapcar '(lambda (e) (length (cdr e))) ents_by_layer)))
		     " objects written to " (itoa (length ents_by_layer)) " files."))
      (princ "\nCould not write files.")
   )
   (princ)
)









(defun C:EHR_TEST (/ crds ents ss)
  (MAKE_LAYER "TEST_COORDS" '((62 . 4)))
  (and
    (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE,HATCH")
                         (-4 . "<NOT")
                         (8 . "TEST_COORDS")
                         (-4 . "NOT>")

                     )
             )
    )
       (setq ents (SS2LST ss))
  )


(princ "\nWorking...")
(setq c 0
      l (length ents))
  (foreach e ents
    
    (setq c (1+ c))
    (princ (strcat "\rEntity " (itoa c)"/" (itoa l)))

     (setq crds (vl-remove nil (ENT->SEGS_RZ e)))
     ;(princ (strcat "\n" (VL-PRINC-TO-STRING crds)))
    (foreach crd crds
      ;(princ (strcat "\n" (vl-princ-to-string crd)))
      (PLINE_MAKE
        crd
        nil
        '((8 . "TEST_COORDS"))

      )
    )
  )
  (princ )
)


(defun C:EHR_HELP ()
   (princ
      "\nCOMMANDS:
	EHR_WRITE - Writes YX coordinates to txt files.
		\t\tFiles are saved in the drawing directory with name format \"DWGNAME_LAYERNAME.txt\".
		\t\tFiles will be ovewritten if already exist.
	EHR_SETTINGS - Allows user to set the chord length for arcs/polyline arcs that will be converted to straight segments and the number of digits for the coordinates.
		\t\tDefaults: Nr. of digits = 3, Chord length = 1.5
	EHR_TEST - Visual aid to check if the coordinates that will be writen to file are geometrically correct. Creates \"TEST_COORDS\" layer.
	EHR_HELP - Displays the commands description (this message)."
   )
   
   
   (princ)
)
(princ "\nEHR APP loaded.")
(C:EHR_HELP)












