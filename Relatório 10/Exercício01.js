// Classe base
class Pokemon {
    // Encapsulamento
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        // Atributos públicos
        this.apelido = apelido;
        this.tipo = tipo;

        // Atributo privado
        this.#vida = vidaInicial;
    }

    // Getter
    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;

        if (this.#vida < 0) {
            this.#vida = 0;
        }

        console.log(`${this.apelido} sofreu ${pontos} de dano e ficou com ${this.#vida} de vida.`);
    }

    // Virtual
    // Ataque genérico
    atacar(alvo) {
        console.log(`${this.apelido} usa um ataque genérico em ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}


// Herança
// Squirtle é um pokemon de agua
class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    // Sobrescrita
    atacar(alvo) {
        console.log(`${this.apelido} usa Jato d'Água em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

// Bulbasaur é um pokemon de planta
class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    // Sobrescrita
    atacar(alvo) {
        console.log(`${this.apelido} usa Chicote de Vinha em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

// Apelidos e vida do squirtle e bulbasaur
const squirtle  = new Squirtle('Mr. Água', 40);
const bulbasaur = new Bulbasaur('Bulba', 30);

console.log('--- BATALHA ---');

// Bulbasaur ataca o Squirtle uma vez
bulbasaur.atacar(squirtle);

// Squirtle ataca o Bulbasaur duas vezes
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

// Mostrando a vida dos dois usando o getter
console.log('\n--- VIDA FINAL ---');
console.log(`${squirtle.apelido}: ${squirtle.vida}`);
console.log(`${bulbasaur.apelido}: ${bulbasaur.vida}`);

// Tentando acessar o atributo privado de fora
// Se descomentar a linha abaixo, dá SyntaxError, porque #vida só existe dentro da classe Pokemon
// console.log(squirtle.#vida);
