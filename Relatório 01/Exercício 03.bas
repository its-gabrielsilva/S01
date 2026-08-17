' Declaras as variáveis
Dim horas As integer
Dim minutos As integer
Dim segundos As integer

' Inserir a quantidade de horas a serem analisadas
input "Insira a quantidade de horas: "; horas

' Conversor de horas para minutos e segundos
minutos = horas * 60
segundos = horas * 7200

' Mostrar as horas analisadas e sua respectiva conversão para minutos e segundos
Print " Horas analisadas: "; horas; " hora(s)"
Print horas; " hora(s) = "; minutos; " minuto(s)"
Print horas; " hora(s) = "; segundos; " segundo(s)"

Sleep
