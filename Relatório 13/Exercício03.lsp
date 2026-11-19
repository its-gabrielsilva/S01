; escuridao vai de 0 (joia limpa) a 100
(defstruct garota-magica
  nome
  escuridao
  bruxas)

; caso base: grupo vazio vale 0
; caso recursivo: escuridao da primeira + total do resto
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

; mapcar extrai o numero de bruxas de cada garota, reduce soma tudo
(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

; nao altera g: devolve uma garota nova com os mesmos campos
; se a quantidade cobre toda a escuridao, a joia nova fica limpa (0)
(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((grupo (list
                 (make-garota-magica :nome "Mami" :escuridao 20
                                     :bruxas 12)
                 (make-garota-magica :nome "Sayaka" :escuridao 55
                                     :bruxas 6)
                 (make-garota-magica :nome "Kyoko" :escuridao 35
                                     :bruxas 9)))
         ; cons cria um grupo novo; o original continua com 3
         (grupo-novo (cons (make-garota-magica :nome "Homura"
                                               :escuridao 10
                                               :bruxas 3)
                           grupo))
         ; purifica a Sayaka (segunda do grupo original)
         (sayaka (cadr grupo))
         (sayaka-limpa (purifica sayaka 30)))

    (format t "--- Grupo ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Novo contrato ---~%")
    (format t "Grupo original: ~a~%" (escuridao-total grupo))
    (format t "Grupo novo: ~a~%" (escuridao-total grupo-novo))

    (format t "--- Purificacao ---~%")
    (format t "~a original: ~a~%" (garota-magica-nome sayaka)
            (garota-magica-escuridao sayaka))
    (format t "~a purificada: ~a~%" (garota-magica-nome sayaka-limpa)
            (garota-magica-escuridao sayaka-limpa))))

; precisa ficar depois de todas as definicoes
(main)