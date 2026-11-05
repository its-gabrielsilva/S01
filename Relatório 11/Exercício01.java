public class Main {
    public static void main(String[] args) {

        // Polimorfismo
        Morador howl = new Mago("Howl", "Transformação em Corvo");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        // Mesmo método é chamado nos dois, mas cada objeto executa um apresentar diferebte
        howl.apresentar();
        calcifer.apresentar();

        // Se descomentar a linha abaixo, o programa nem compila:
        // erro: Morador is abstract; cannot be instantiated
        // Morador generico = new Morador("Fulano");

    }
}

// Classe abstrata
abstract class Morador {

    // Encapsulamento
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    // Getter
    public String getNome() {
        return nome;
    }

    // Método abstrato
    public abstract void apresentar();

}

// Herança
class Mago extends Morador {

    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    // Sobrescrita
    @Override
    public void apresentar() {
        System.out.println("Olá! Sou " + getNome() + "! | Feitiço: " + feitico);
    }

}

// Herança
class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    // Sobrescrita
    @Override
    public void apresentar() {
        System.out.println("Olá! Sou " + getNome() + "! E eu faço o castelo andar!");
    }

}
