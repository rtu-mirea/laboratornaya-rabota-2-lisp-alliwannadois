;; Задание 3. Сжатие/разжатие списка

(defun compress(lst)
  (let ((f_stage (rec lst nil)))
    (loop for i from 1 to (length f_stage)
      do 
        (if (eq (car (car f_stage)) 1)
          (setf f_stage (append (cdr f_stage) (cdr (car f_stage))))
          (setf f_stage (append (cdr f_stage) (list (car f_stage))))
        )
    )
    f_stage
  )
)

(defun rec(lst new_lst)
  (if (eq (car lst) (car (cdr (car new_lst))))
    (setf new_lst 
      (append 
        (list (list (+ (car (car new_lst)) 1) (car lst)))
        (cdr new_lst)
      )
    )
    (setf new_lst (append (list (list 1 (car lst))) new_lst))
  )
  (if (eq (cdr lst) nil)
    (reverse new_lst)
    (rec(cdr lst) new_lst)
  )
)

;; Тестирование сжатия списка
(compress `(1 1 1 0 1 0 0 1 1 3))







;; Функция decompress осуществляет разжатие сжатого до этого списка.

(defun decompress(lst)
  (loop for i from 1 to (length lst)
    do
      (if (consp (car lst))
        (setf lst (append (cdr lst) (list (car lst))))
        (setf lst (append (cdr lst) (list (list 1 (car lst)))))
      )
  )
  (let ((new_lst `()))
    (loop for i from 1 to (length lst)
      do
        (loop for j from 1 to (car (car lst))
          do
            (setf new_lst (append new_lst (cdr (car lst))))
        )
        (setf lst (cdr lst))
    )
    new_lst
  )
)

;; Тестирование разжатия списка
(decompress (compress `(1 0 1 0 0 1 1 3)))