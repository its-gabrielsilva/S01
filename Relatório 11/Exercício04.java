import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        // Polimorfismo: cada monstro é de um tipo diferente, mas todos são tratados como Monstro
        // os monstros são criados antes do cozinheiro, ou seja, existem fora dele
        Slime slime = new Slime("Slime Verde");
        Mandragora mandra = new Mandragora("Mandrágora");

        // A Panela é criada dentro do Cozinheiro, por isso só passamos o material
        Cozinheiro senshi = new Cozinheiro("Senshi", "Ferro"); 

        // Agregação: o cozinheiro junta os monstros que já existiam
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandra);

        // Cada monstro mostra a sua própria receita
        senshi.servirBanquete();
    }
}

// Classe abstrata: não existe "monstro genérico", todo monstro é de um tipo específico
abstract class Monstro{

    // Encapsulamento
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    // Getter
    public String getNome() {
        return nome;
    }

    // Método abstrato: cada tipo de monstro tem a sua receita
    public abstract String receita();

}

// Herança
class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }
    
    // Sobrescrita
    @Override
    public String receita() {
        return "Tempura crocante de slime ao molho ácido!";
    }

}

// Herança
class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }
    
    // Sobrescrita
    @Override
    public String receita() {
       return "Sopa cozida de raízes mágicas com legumes do calabouço!";
    }

}

// Parte composta: só existe dentro do Cozinheiro
class Panela{

  // Encapsulamento
  private String material;

    public Panela(String material) {
        this.material = material;
    }

    // Getter
    public String getMaterial() {
        return material;
    }

}

class Cozinheiro{

  private String nome;
  private Panela panela;
  // Guarda Monstro, então aceita Slime, Mandragora ou qualquer outro monstro
  private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        // Composição: a Panela é criada aqui dentro, nasce junto com o Cozinheiro
        this.panela = new Panela(materialDaPanela);
        // A lista nasce vazia
        this.ingredientes = new ArrayList<>();
    }

    // Recebe um monstro já criado e adiciona à lista
    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete(){
        System.out.println("Nome Cozinheiro: " + nome + " | Material da Panela: " +panela.getMaterial());
        // For-each percorre os ingredientes
        // Polimorfismo: receita() é chamado em todos, mas cada monstro executa a sua versão
        for (Monstro monstro : ingredientes){
          System.out.println("Ingrediente: " + monstro.getNome() + " | Modo de Preparo: " +monstro.receita());
        }
    }
}

// Composição: a Panela é criada dentro do construtor do Cozinheiro,
// então nasce com ele e não existe sem ele.
// Agregação: o Slime e a Mandragora são criados na main, fora do Cozinheiro,
// e só são adicionados à lista; continuam existindo mesmo sem ele.