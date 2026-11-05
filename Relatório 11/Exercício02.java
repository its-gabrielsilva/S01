import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio cafecoado = new ItemDoCardapio("Café Coado na Hora", 12.99);
        ItemDoCardapio currydacasa = new ItemDoCardapio("Curry da Casa", 29.99);

        // Herança: o combo é criado como ComboLeblanc, mas também é um ItemDoCardapio
        ComboLeblanc combocurry = new ComboLeblanc("Combo Curry + Café", 39.99);

        // Composição: o cardápio é criado dentro do CafeLeblanc
        CafeLeblanc cafe = new CafeLeblanc();

        // Agregação: os itens já existiam e só são adicionados ao café
        cafe.adicionar(cafecoado);
        cafe.adicionar(currydacasa);
        cafe.adicionar(combocurry);

        // Polimorfismo: o mesmo precoFinal() é chamado em todos os itens,
        // mas o combo executa a sua versão, com desconto
        cafe.mostrarCardapio();
        
    }
}

// Classe base
class ItemDoCardapio {

    // Encapsulamento
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    // Getters
    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    // Método que as filhas podem sobrescrever
    public double precoFinal(){
       return preco;
    }

}

// Herança
class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }
    

    // Sobrescrita: retorna o preço com 10% de desconto
    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }

}

class CafeLeblanc {

    // Guarda ItemDoCardapio, então aceita itens comuns e combos
    private ArrayList<ItemDoCardapio> cardapio;

    // Construtor sem parâmetros: o cardápio nasce vazio
    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    // Recebe um item já criado e adiciona ao cardápio
    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    // For-each percorre o cardápio; printf formata o preço com 2 casas decimais
    public void mostrarCardapio(){
        for (ItemDoCardapio item : cardapio){
          System.out.printf("[Cardápio] %s - R$ %.2f%n", item.getNome(), item.precoFinal());
        }
    }

}