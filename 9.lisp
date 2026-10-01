(uiop:define-package :leetcode
  (:use :cl))

(in-package :leetcode)

;; The "cheating" method using strings, but definitely easy to
;; implement and that's a great merit
(defun palindrome-easy? (n)
  (let* ((original (write-to-string n))
	 (reverse (reverse original)))
    (equal original reverse)))
