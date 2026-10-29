// Classe base
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    // VIRTUAL
    // ataque genérico de aura
    atacar(alvo) {
        console.log(`${this.nome} lança um ataque de aura contra ${alvo.nome}!`);
    }
}


// Herança
class Intensificador extends UsuarioDeNen {
    // Sobrescrita
    atacar(alvo) {
        console.log(`${this.nome} (Intensificador) acerta um soco reforçado de aura em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Transmutador) transforma a aura em eletricidade e descarrega em ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Materializador) materializa uma corrente de aura e prende ${alvo.nome}!`);
    }
}


// Parte agregada
// Aranha existe independente da Trupe
class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}


// Agregação
class TrupeFantasma {
    // Encapsulamento
    #aranhas;

    // Agregação
    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\n--- TRUPE FANTASMA AVISTADA EM ${this.cidade} ---`);
        this.#aranhas.forEach(a => console.log(`Nº ${a.numero} - ${a.nome}`));
    }

    buscarAranha(numero) {
        // .find() percorre o array e retorna o primeiro elemento que passa na condição
        return this.#aranhas.find(a => a.numero === numero);
    }
}

// Aranhas são criadas ANTES da Trupe
const feitan = new Aranha('Feitan', 5);
const nobunaga = new Aranha('Nobunaga', 11);

const trupe = new TrupeFantasma('Yorknew City', [feitan, nobunaga]);

trupe.revelarAranhas();

// Busca uma das duas Aranhas pelo número tatuado
const alvo = trupe.buscarAranha(11);

// Array com um usuário de Nen de cada tipo
const hunters = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

console.log(`\n--- HUNTERS ATACAM ${alvo.nome.toUpperCase()}! ---`);

// Polimorfismo
hunters.forEach(h => h.atacar(alvo));