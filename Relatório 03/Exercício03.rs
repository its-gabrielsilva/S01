use std::io;

// Funcao que recebe tres inteiros e nao retorna nenhum valor
fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("--- Numeros no intervalo terminados em {} ---", digito);

    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    let mut entrada_digito = String::new();
    let mut entrada_inferior = String::new();
    let mut entrada_superior = String::new();


    // Ler o digito final, limite inferior e superior
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin()
        .read_line(&mut entrada_digito)
        .expect("Erro ao ler");

    println!("Digite o limite inferior:");
    io::stdin()
        .read_line(&mut entrada_inferior)
        .expect("Erro ao ler");

    println!("Digite o limite superior:");
    io::stdin()
        .read_line(&mut entrada_superior)
        .expect("Erro ao ler");

    // Converter as strings lidas para i32
    let digito: i32 = entrada_digito.trim().parse().unwrap_or(0);
    let limite_inferior: i32 = entrada_inferior.trim().parse().unwrap_or(0);
    let limite_superior: i32 = entrada_superior.trim().parse().unwrap_or(0);

    // Mostrar o resultado achado
    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}