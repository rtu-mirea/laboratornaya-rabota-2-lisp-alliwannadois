(defun readfile(file)
(let ((in (open file :direction :input :if-does-not-exist nil)))
    (when in
    (loop for line = (read-line in nil)
         while line do (format t "~a~%" line))
    (close in)))
)

(readfile "C:/Users/drago/Desktop/file.txt")
