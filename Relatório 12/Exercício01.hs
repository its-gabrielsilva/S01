-- nome, preço e intensidade (1 a 10)
data Cafe = Cafe String Double Int
 
-- nome e preço do café
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco
 
-- funções auxiliares para ler cada campo
nomeDe :: Cafe -> String
nomeDe (Cafe nome _ _) = nome
 
-- classifica o café pela intensidade
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 && intensidade <= 7 = "Equilibrado"
    | otherwise = "Suave"
 
-- leite custa 2.0 a mais
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
    if comLeite
        then preco + 2.0
        else preco
 
main :: IO ()
main = do
    -- um café por faixa de intensidade
    let cafeForte = Cafe "Blend do Sojiro" 22.0 9
    let cafeEquilibrado = Cafe "Cafe da Casa" 15.0 6
    let cafeSuave = Cafe "Cafe Suave de Tokyo" 12.0 3
    let cafes = [cafeForte, cafeEquilibrado, cafeSuave]
 
    putStrLn "--- Cafes do Dia ---"
    mapM_ putStrLn (map descrever cafes)
 
    -- lambda para montar "nome: força" de cada café
    putStrLn "\n--- Forca dos Cafes ---"
    mapM_ putStrLn (map (\c -> nomeDe c ++ ": " ++ forca c) cafes)
 
    -- mesmo café com e sem leite
    putStrLn "\n--- Calculo de Preco com Leite ---"
    putStrLn "Blend do Sojiro com leite:"
    print (precoDoPedido True cafeForte)
 
    putStrLn "Blend do Sojiro sem leite:"
    print (precoDoPedido False cafeForte)
