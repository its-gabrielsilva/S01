print("--- FILTRAR ELEMENTOS MAIORES QUE UM LIMITE ---")

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

    -- Ler o valor limite
    print("Digite o valor limite (K):")
    local K = tonumber(io.read())

    if K then

        -- Filtrar os elementos que sao maiores que o limite
        function filtrarMaiores(tabela, limite)
            local novaTabela = {}

            for i = 1, #tabela do
                if tabela[i] > limite then
                    table.insert(novaTabela, tabela[i])
                end
            end

            return novaTabela
        end

        -- Guradar o resultado da funcao
        local maiores = filtrarMaiores(tabela, K)

        -- Mostrar os numeros maiores que o limite
        print("--- Elementos maiores que " .. K .. " ---")
        for i = 1, #maiores do
            print(maiores[i])
        end

    else
        print("Entrada invalida! Digite apenas numeros.")
    end

else
    print("Entrada invalida! A quantidade deve ser um numero maior que zero.")
end