(import (rnrs))

(define (dna->rna dna)
  (define (convert-nucleotide nucleotide)
    (case nucleotide
      ((#\G) #\C)
      ((#\C) #\G)
      ((#\T) #\A)
      ((#\A) #\U)
      (else (error "Ungültiges Nukleotid" nucleotide))))
  
  (let ((nucleotide-list (string->list dna)))
    (list->string (map convert-nucleotide nucleotide-list))))
