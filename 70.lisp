(uiop:define-package :leetcode
  (:use :cl))

(in-package :leetcode)


;; Naive first glance recursive approach
(declaim (ftype (function (fixnum &optional fixnum) fixnum) climb-naive))
(defun climb-naive (n &optional (accum 0))
  (cond
    ((= n 0) (1+ accum))
    ((< n 0) accum)
    (t (climb (- n 2) (climb (1- n) accum)))))

;; Optimized tail recursive approach
(declaim (ftype (function (integer) integer) climb-tail-recursive))
(defun climb-tail-recursive (n)
  (if (<= n 2)
      n
      (labels ((recurse (n pprev prev)
		 (if (= n 0)
		     pprev
		     (recurse (1- n) prev (+ pprev prev)))))
	(recurse (1- n) 1 1))))

;; Now iterative
(declaim (ftype (function (integer) integer) climb-iterative))
(defun climb-iterative (n)
  (if (<= n 2)
      n
      (loop repeat (1- n)
	    for pprev = 1 then prev
	    for prev = 1 then (+ pprev prev)
	    finally (return pprev))))
