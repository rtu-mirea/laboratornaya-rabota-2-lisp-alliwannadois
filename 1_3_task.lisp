(defun explore(element elements position)
    (if (not (eq elements nil))
        (if (= element (car elements))
            position
            (explore element (cdr elements) (+ position 1))
        )
    )
)

(explore 5 (list 2 3 6 7 5) 0)
