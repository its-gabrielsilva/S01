' Declaração das variáveis utilizadas no programa
Dim peso As single
Dim agua As integer
Dim meta As single

' Inserir o peso do usuário e a quantidade de água ingerida
Input "Qual o seu peso?"; peso
Input "Quantidade de agua ingerida:"; agua

' Cálculo da meta diária
meta = peso * 35

' Verificar se a quantidade de água inderida pelo usuário atingiu a meta
if agua >= meta then
    Print "Meta Atingida!"
else
    Print "Meta nao atingida"    
End if

Sleep    
