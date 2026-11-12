-- um esboço do caderno: título, técnica usada e horas gastas
data Esboco = Esboco
    { titulo  :: String
    , tecnica :: String
    , horas   :: Int
    }

-- o caderno é uma lista e o esboço novo entra na frente,
-- então o primeiro elemento é sempre o mais recente
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "Nenhum esboço no caderno."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"

-- conta os esboços na mão, sem length
contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

-- soma as horas do primeiro esboço com o total do resto, sem sum nem map
horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
    -- do mais recente para o mais antigo
    let esboco1 = Esboco "Criatura do Pântano" "Nanquim" 7
    let esboco2 = Esboco "Ruínas da Catedral" "Grafite" 11
    let esboco3 = Esboco "Floresta ao Anoitecer" "Carvão" 10

    let esbocos = [esboco1, esboco2, esboco3]
    let cadernoVazio = []

    putStrLn "--- Esboço mais recente ---"
    putStrLn (esbocoMaisRecente esbocos)

    putStrLn "\n--- Número de Esboços ---"
    print (contarEsbocos esbocos)

    putStrLn "\n--- Total de Horas Desenhando ---"
    print (horasDesenhando esbocos)

    putStrLn "\n--- Esboço mais recente (Caderno Vazio) ---"
    putStrLn (esbocoMaisRecente cadernoVazio)

    -- esboço novo entra na frente com :, o caderno anterior não muda
    let esbocoNovo = Esboco { titulo = "Névoa sobre o Cemitério", tecnica = "Nanquim", horas = 5 }
    let cadernoNovo = esbocoNovo : esbocos

    putStrLn "\n--- Esboço mais recente (Caderno Novo) ---"
    putStrLn (esbocoMaisRecente cadernoNovo)

    putStrLn "\n--- Comparação de Contagem ---"
    putStrLn ("Caderno anterior: " ++ show (contarEsbocos esbocos))
    putStrLn ("Caderno novo: " ++ show (contarEsbocos cadernoNovo))

    -- putStrLn (titulo (head cadernoVazio))
    -- erro em tempo de execução: head não funciona em lista vazia