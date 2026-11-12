-- peso máximo (em kg) que a vassoura aguenta por viagem
pesoMaximo :: Double
pesoMaximo = 40.0

-- pesoMaximo = 50.0
-- não compila: pesoMaximo já foi definido acima e em Haskell não há reatribuição

-- uma encomenda do dia: quem recebe, peso em kg e valor do frete
data Encomenda = Encomenda
    { destinatario :: String
    , peso         :: Double
    , frete        :: Double
    }

-- destinatário, peso e frete, lidos pelas funções de campo
descrever :: Encomenda -> String
descrever enc = destinatario enc ++ " - Peso: " ++ show (peso enc) ++ "kg - Frete: R$ " ++ show (frete enc)

-- mantém só as encomendas que a vassoura aguenta
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\enc -> peso enc <= pesoMaximo) encomendas

-- soma o frete de todas as encomendas da lista
totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
    -- cinco encomendas realizadas por Kiki, duas acima do peso máximo (45.0 e 60.0)
    let encomenda1 = Encomenda { destinatario = "Madame", peso = 8.0, frete = 25.0 }
    let encomenda2 = Encomenda { destinatario = "Osono", peso = 5.0, frete = 15.0 }
    let encomenda3 = Encomenda { destinatario = "Tombo", peso = 3.0, frete = 10.0 }
    let encomenda4 = Encomenda { destinatario = "Cliente da Padaria", peso = 45.0, frete = 50.0 }
    let encomenda5 = Encomenda { destinatario = "Cliente da Cidade Vizinha", peso = 60.0, frete = 70.0 }

    let encomendas = [encomenda1, encomenda2, encomenda3, encomenda4, encomenda5]
    let entregaveis = cabemNaVassoura encomendas

    putStrLn "--- Todas as Encomendas do Dia ---"
    mapM_ putStrLn (map descrever encomendas)

    putStrLn "\n--- Encomendas que Cabem na Vassoura ---"
    mapM_ putStrLn (map descrever entregaveis)

    putStrLn "\n--- Total de Fretes (Encomendas que Cabem) ---"
    putStrLn ("Total: R$ " ++ show (totalDeFretes entregaveis))
