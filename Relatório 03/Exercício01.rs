use std::io;

// Fazer a funcao para validar a placa
fn validar_placa(placa: &str) -> bool {
    // Fazer a placa ter pelo menos 7 caracteres
    if placa.len() < 7 {
        return false;
    }

    let mut qtd_maiusculas = 0;
    let mut qtd_numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            qtd_maiusculas += 1;
        }
        if c.is_numeric() {
            qtd_numeros += 1;
        }
    }

    // Fazer a placa ter pelo menos 4 maiusculas e 2 numeros
    qtd_maiusculas >= 4 && qtd_numeros >= 2
}

fn main() {
    loop {
        // Criar uma string mutavel e vazia
        let mut placa = String::new();

        // Ler a placa digitada
        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut placa).expect("Erro ao ler");

        // Remover a quebra de linha
        let placa = placa.trim();

        // Usar a funcao para mostrar se a placa e valida ou nao
        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
