print("--- TABELA DE POTENCIAS ---")

-- Inserir o expoente inicial e final e a base
print("Digite o expoente inicial (M):")
local M = tonumber(io.read())

print("Digite o expoente final (N):")
local N = tonumber(io.read())

print("Digite a base:")
local base = tonumber(io.read())

-- Validar se todas as entradas sao numeros validos
if M and N and base then

    -- Definir a funcao que gera a tabela de potencias
    function gerarTabelaPotencias(inicio, fim, base)
        for i = inicio, fim do
            local potencia = base ^ i
            print(base .. "^" .. i .. " = " .. potencia)
        end
    end

    -- Caso M <= N gerar a sua tabela de potencias, caso M > N mostrar o erro
    if M <= N then
        gerarTabelaPotencias(M, N, base)
    else
        print("Erro: o expoente inicial (M) deve ser menor ou igual ao expoente final (N).")
    end

else
    print("Entrada invalida! Digite apenas numeros.")
end
