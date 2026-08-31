use std::io;

// Funcao para calcular a pontuacao final
fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    // Fazer media aritmetica entre as duas provas
    let npt = (prova1 + prova2) / 2.0;

    // Fazer media ponderada entre a npt e a redacao
    let pontuacao_final = (npt * 0.6) + (redacao * 0.4);

    pontuacao_final
}

fn main() {
    let mut entrada_prova1 = String::new();
    let mut entrada_prova2 = String::new();
    let mut entrada_redacao = String::new();

    // Ler os notas das provas 1 e 2 e a redacao
    println!("Digite a nota da Prova Teorica 1:");
    io::stdin()
        .read_line(&mut entrada_prova1)
        .expect("Erro ao ler");

    println!("Digite a nota da Prova Teorica 2:");
    io::stdin()
        .read_line(&mut entrada_prova2)
        .expect("Erro ao ler");

    println!("Digite a nota da Redacao:");
    io::stdin()
        .read_line(&mut entrada_redacao)
        .expect("Erro ao ler");

    // Converter as strings para f64
    let prova1: f64 = entrada_prova1.trim().parse().unwrap_or(0.0);
    let prova2: f64 = entrada_prova2.trim().parse().unwrap_or(0.0);
    let redacao: f64 = entrada_redacao.trim().parse().unwrap_or(0.0);

    // Usar a funcao para calcular o resultado
    let resultado = calcular_pontuacao(prova1, prova2, redacao);

    // Mostar se o candidato passou ou nao do processo seletivo
    if resultado >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao.");
    }

    println!("Pontuacao Final: {:.2}", resultado);
}