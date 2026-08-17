' Declarar as variáveis
Dim pin As integer
Dim num As integer

' PIN definido
pin = 4321

' PIN que vai ser digitado pelo usuário
Input "Digite o PIN de Acesso: "; num

' Enquanto o PIN digitado for diferente do PIN correto solicita que o usuário digite o PIN novamente
while num <> pin
    print "PIN invalido. Tente novamente!"
    input "Digite o PIN de acesso: "; num
wend

' Quando o PIN estiver correto exibe a mensagem de confirmação
print "Transacao autorizada"

Sleep