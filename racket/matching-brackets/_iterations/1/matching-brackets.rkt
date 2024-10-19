#lang racket

(provide balanced?)

; Define a function to check if the closing character matches the expected opening character
(define (matching-pair? close-char open-char)
  (match close-char
    [#\) (equal? open-char #\()]
    [#\] (equal? open-char #\[)]
    [#\} (equal? open-char #\{)]
    [_ #f]))

; Define a function to update the stack based on the current character
(define (update-stack char stack)
  (cond
    [(member char '(#\( #\[ #\{)) (cons char stack)] ; Add opening char to stack
    [(member char '(#\) #\] #\})) 
     (if (or (null? stack) (not (matching-pair? char (car stack))))
         #f ; Unmatched or mismatched closing char
         (cdr stack))] ; Matched pair, remove from stack
    [else stack])) ; Ignore non-bracket characters

; Define the main function to check if the string is balanced
(define (balanced? str)
  (let ([result (foldl (lambda (char stack)
                         (if (eq? stack #f)
                             #f
                             (update-stack char stack)))
                       '()
                       (string->list str))])
    (and (not (eq? result #f)) (null? result))))
