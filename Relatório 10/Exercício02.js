// Parte composta
// Pistola é uma parte do agente
class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}


// Classe base
class AgenteProtocolo {
    // Encapsulamento
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;

        // Composição
        // Pistola pertence ao agente e não existe fora dele
        this.#pistola = new Pistola(modeloDaPistola);
    }

    // Contrato
    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar o método 'usarHabilidade()'`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} [${this.#pistola.modelo}] -> ${this.usarHabilidade()}`);
    }
}


// Herança
// Cada uma sobrescreve usarHabilidade() com a habilidade típica da sua função

class Controlador extends AgenteProtocolo {
    // Sobrescrita
    usarHabilidade() {
        return 'lança uma cortina de fumaça para bloquear a visão do inimigo.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'lança um drone que revela a posição dos inimigos.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'ativa uma habilidade de fogo e avança na frente do time.';
    }
}


// Agregação
class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- Esquadrão ${this.nome} inicia a partida! ---`);

        // Polimorfismo
        // Mesma função para todos, mas cada um usa a sua própria habilidade
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

// Agentes criados
const brimstone = new Controlador('Brimstone', 'Classic');
const omen = new Controlador('Omen', 'Ghost');
const sova = new Iniciador('Sova', 'Sheriff');
const phoenix = new Duelista('Phoenix', 'Shorty');

const esquadrao = new Esquadrao('Alpha', [brimstone, omen, sova, phoenix]);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrão:');
esquadrao.listarControladores().forEach(c => console.log(`- ${c.codinome}`));

// AgenteProtocolo direto (a classe base não implementa a habilidade)
// o objeto é criado normalmente, mas a chamada abaixo gera um erro
// se descomentar a segunda linha gera um erro
const agenteGenerico = new AgenteProtocolo('Desconhecido', 'Classic');
// agenteGenerico.entrarEmCombate();