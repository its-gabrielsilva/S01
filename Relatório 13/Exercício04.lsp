; elemento e uma keyword (:pyro, :hydro, :cryo, :electro, :anemo)
; dificuldade vai de 1 a 5
(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

; case compara keywords direto; o otherwise cobre os demais elementos
(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

; let* porque o segundo passo usa o resultado do primeiro
; filtra pela dificuldade e depois transforma cada dominio em texto
(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                     (lambda (d)
                       (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~a - ~,1f mora"
                            (dominio-nome d)
                            (recompensa-final d)))
                  possiveis)))
    textos))

(defun main ()
  (let* ((dominios (list
                    (make-dominio :nome "Ruinas do Trovao"
                                  :elemento :electro
                                  :dificuldade 3 :mora 600)
                    (make-dominio :nome "Caverna Aquatica"
                                  :elemento :hydro
                                  :dificuldade 2 :mora 500)
                    (make-dominio :nome "Templo do Vento"
                                  :elemento :anemo
                                  :dificuldade 4 :mora 800)
                    (make-dominio :nome "Forja de Fogo"
                                  :elemento :pyro
                                  :dificuldade 5 :mora 1000)
                    (make-dominio :nome "Santuario de Gelo"
                                  :elemento :cryo
                                  :dificuldade 1 :mora 300)))
         (original (car dominios))
         ; setf muda o objeto no lugar, entao altero so uma copia
         (copia (copy-dominio original)))

    (format t "--- Rota (dificuldade ate 3) ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "--- Total ---~%")
    (format t "Mora da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (setf (dominio-mora copia) 2000)
    (format t "--- Copia com setf ---~%")
    (format t "Mora da copia: ~a~%" (dominio-mora copia))
    (format t "Mora do original: ~a~%" (dominio-mora original))))

; precisa ficar depois de todas as definicoes
(main)