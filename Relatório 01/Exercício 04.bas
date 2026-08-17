' Declarar as variaveis
Dim km As single
Dim tempo As integer
Dim pace As single

' Inserir a quantidade de quilometros percorrido(s) e minutos(s) gasto(s)
Input "Quilometro(s) percorrido(s): "; km
Input "Tempo gasto em minutos: "; tempo

' Calcular o pace médio do corredor
pace = tempo/km

' Mostrar o resultado do pace do corredor
PRINT USING "Pace medio do corredor: #.## min/km"; pace

Sleep