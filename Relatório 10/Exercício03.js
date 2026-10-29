// Parte composta
// FichaDeCriatura só existe dentro do DiarioMisterioso
class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    // Retorna um texto com os dois dados
    descrever() {
        return `${this.criatura} — nível de perigo: ${this.nivelDePerigo}`;
    }
}


// Composição
class DiarioMisterioso {
    // Encapsulamento
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        // Composição
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\n--- DIÁRIO ${this.numero} ---`);

        // .forEach() percorre o array e usa o texto retornado por descrever()
        this.#fichas.forEach(ficha => console.log(ficha.descrever()));
    }
}


// Parte agregada
class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}


// Agregação
class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    // Agregação
    // O funcionário é criado fora da Cabana que só guarda uma referência a ele
    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- CABANA DO MISTÉRIO (dono: ${this.dono}) ABRIU AS PORTAS! ---`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} - ${f.cargo}`));
    }
}


// Composição em ação: as fichas são criadas por dentro do diário
const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 'Alto');
diario.anotar('Gideon Gleeful', 'Médio');
diario.anotar('Mulher-Lobisomem', 'Baixo');

diario.exibirFichas();

// Agregação em ação: os funcionários já existiam antes da Cabana
const soos  = new Funcionario('Soos', 'Faz-Tudo');
const wendy = new Funcionario('Wendy', 'Caixa');

const cabana = new CabanaDoMisterio('Stan Pines');
cabana.contratar(soos);
cabana.contratar(wendy);

cabana.abrirAsPortas();

// COMPOSIÇÃO:
// DiarioMisterioso e FichaDeCriatura. As fichas são criadas DENTRO do método
// anotar(), e ficam guardadas no array privado #fichas. Quem de fora só passa
// o nome da criatura e o nível de perigo, nunca uma ficha pronta. Se o diário
// deixar de existir, as fichas deixam de existir junto com ele.
//
// AGREGAÇÃO (relação fraca: "o todo só guarda uma referência à parte"):
// CabanaDoMisterio e Funcionario. Soos e Wendy foram criados ANTES da Cabana,
// no main, e ela apenas os recebe em contratar(). Se a Cabana deixar de
// existir, os funcionários continuam existindo normalmente fora dela.