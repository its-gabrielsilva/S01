print("--- CONTADOR DE OCORRENCIAS EM TABELA ---")

-- Ler a quantidade de numeros na tabela
print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

if N and N > 0 then

    -- Criar a tabela vazia
    local tabela = {}

    -- Ler os N elementos e inserir na tabela
    for i = 1, N do
        print("Digite o elemento " .. i .. ":")
        local valor = tonumber(io.read())
        table.insert(tabela, valor)
    end

    -- Ler o numero que sera buscado
    print("Digite o numero X a ser buscado:")
    local X = tonumber(io.read())

    if X then

        -- Calcular as ocorrencias do numero buscado
        function contarOcorrencias(tabela, alvo)
            local j = 0

            for i = 1, #tabela do
                if tabela[i] == alvo then
                    j = j + 1
                end
            end

            return j
        end

        -- Mostrar o resultado das ocorrencias do numero buscado na tabela
        local resultado = contarOcorrencias(tabela, X)

        print("O numero " .. X .. " aparece " .. resultado .. " vez(es) na tabela.")

    else
        print("Entrada invalida! Digite apenas numeros.")
    end

else
    print("Entrada invalida! A quantidade deve ser um numero maior que zero.")
end