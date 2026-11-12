-- etapas pelas quais um atendimento passa
data Etapa = NaFila | NoBanho | Concluido
    deriving (Show, Eq)

-- um atendimento da casa de banhos: quem é o cliente, o serviço, o valor e a etapa atual
data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor   :: Double
    , etapa   :: Etapa
    }

-- cliente, serviço e etapa (show converte a Etapa em texto)
descrever :: Atendimento -> String
descrever at = cliente at ++ " | Serviço: " ++ servico at ++ " | Etapa: " ++ show (etapa at)

-- devolve uma cópia do atendimento já concluído, o original não muda
concluir :: Atendimento -> Atendimento
concluir c = c { etapa = Concluido }

-- só os atendimentos concluídos já foram pagos
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos = sum (map valor (filter (\at -> etapa at == Concluido) atendimentos))

main :: IO ()
main = do
    -- nenhum atendimento começa concluído
    let at1 = Atendimento "Oshira-sama" "Banho de Ervas" 150.0 NaFila
    let at2 = Atendimento "Sem-Rosto" "Massagem com Ervas" 80.5 NaFila
    let at3 = Atendimento "Deus do Rio" "Banho de Ervas Especial" 250.0 NoBanho

    let atendimentos = [at1, at2, at3]

    -- só o at2 e o at3 passam por concluir, o at1 continua como estava
    let at2Concluido = concluir at2
    let at3Concluido = concluir at3
    let atendimentosAtualizados = [at1, at2Concluido, at3Concluido]

    putStrLn "--- Atendimentos Iniciais ---"
    mapM_ putStrLn (map descrever atendimentos)

    putStrLn "\n--- Atendimentos Atualizados ---"
    mapM_ putStrLn (map descrever atendimentosAtualizados)

    -- a lista original continua sem nada concluído
    putStrLn "\n--- Valor Arrecadado (Inicial) ---"
    putStrLn ("Total: R$ " ++ show (arrecadado atendimentos))

    putStrLn "\n--- Valor Arrecadado (Atualizado) ---"
    putStrLn ("Total: R$ " ++ show (arrecadado atendimentosAtualizados))