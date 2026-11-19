; toxicidade vai de 0 (inofensiva) a 10 (veneno mortal)
(defstruct erva
  nome
  preco-por-grama
  toxicidade)

; a ordem das clausulas importa: o teste de 7+ vem antes do de 4+,
; senao todo veneno cairia em "use com cuidado"
(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

; format nil devolve a string em vez de imprimir, entao a funcao fica pura
(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar esta erva em si mesma antes."
      "Liberada para o paciente."))

(defun main ()
  ; uma erva de cada classificacao
  (let ((ervas (list
                (make-erva :nome "Camomila" :preco-por-grama 3.2
                           :toxicidade 1)
                (make-erva :nome "Ginseng" :preco-por-grama 12.5
                           :toxicidade 5)
                (make-erva :nome "Aconito" :preco-por-grama 8
                           :toxicidade 9))))

    (format t "--- Ervas da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))

    ; dose de 5 g do Ginseng (segunda da lista)
    (format t "--- Preco da dose ---~%")
    (format t "5 g de ~a: R$~,2f~%"
            (erva-nome (cadr ervas))
            (preco-da-dose (cadr ervas) 5))))

; precisa ficar depois de todas as definicoes
(main)
