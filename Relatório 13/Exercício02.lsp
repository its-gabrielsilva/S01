; perigo e sempre uma keyword: :inofensiva, :agressiva ou :leviata
; profundidade em metros
(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Zona Rasa"
                  :profundidade 5 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Kelp"
                  :profundidade 40 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunas"
                  :profundidade 120 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Rio Perdido"
                  :profundidade 300 :perigo :leviata)))

; case compara keywords direto; o otherwise cobre qualquer outra
(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

; format nil devolve a string em vez de imprimir
(defun descreve-criatura (c)
  (format nil "~a (~a) - ~a m - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

; a lambda usa "metros", que vem de fora dela (parametro da funcao)
(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (format t "--- Catalogo completo ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  ; guardo o resultado do filtro para usar na lista e no length
  (let ((fundas (abaixo-de 30 *catalogo*)))
    (format t "--- Abaixo de 30 m ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Total: ~a~%" (length fundas))))

; precisa ficar depois de todas as definicoes
(main)