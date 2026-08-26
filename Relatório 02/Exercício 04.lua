print("--- OPERACOES COM MEDIA, MAIOR VALOR E DIFERENCA ABSOLUTA ---")

-- Calcula a media aritmetica entre dois valores
function calcularMedia(a, b)
    return (a + b) / 2
end

-- Retorna o maior valor entre dois numeros
function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

-- Retorna a diferenca absoluta entre os numeros
function calcularDiferencaAbsoluta(a, b)
    return math.abs(a - b)
end

-- Funcao principal que decide qual subfuncao ira usar
function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)
    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)
    else
        return "Operacao invalida!"
    end
end

-- Ler os numeros e a operacao a ser usada
print("Digite o primeiro numero:")
local n1 = tonumber(io.read())

print("Digite o segundo numero:")
local n2 = tonumber(io.read())

print("Digite a operacao (\"media\", \"maior\" ou \"diferenca\"):")
local operacao = io.read()

-- Mostrar o resultado da operacao
if n1 and n2 then

    local resultado = analisarNumeros(n1, n2, operacao)

    print("Resultado: " .. resultado)

else
    print("Entrada invalida! Digite apenas numeros.")
end