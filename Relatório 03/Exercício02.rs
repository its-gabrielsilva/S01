use std::io;

// Fazer a funcao que recebe o palpite e o numero secreto
fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    // Calcular a diferenca absoluta entre os dois numeros
    let diferenca = (palpite - numero_secreto).abs();

    // Sera verdadeiro se a diferenca for no maximo de 5
    diferenca <= 5
}

fn main() {
    // Numero a ser encontrado pelo usuário
    let numero_secreto: i32 = 67;

    loop {
        let mut entrada = String::new();

        println!("Digite seu palpite:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        // Remover a quebra de linha e converter a string para i32
        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite, numero_secreto) {
            // Calcular a distancia dos numeros
            let distancia = (palpite - numero_secreto).abs();

            // Mostrar se o usuario acertou ou nao
            println!("Parabens, voce acertou o alvo!");
            println!(
                "Voce ficou a apenas {} unidade(s) do numero secreto ({}).",
                distancia, numero_secreto
            );
            break;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}