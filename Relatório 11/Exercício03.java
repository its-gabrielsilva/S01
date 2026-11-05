import java.util.HashMap;

public class Main {
    public static void main(String[] args) {

        // Polimorfismo: cada ser é de um tipo diferente,
        // mas todos podem ser tratados como Sobrenatural
        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai vovo = new EspiritoYoukai("Turbo Vovó");

        // Composição: o mapa nasce vazio, sem nenhum avistamento
        MapaDeAvistamentos mapa = new MapaDeAvistamentos(); 

        // Agregação: os seres já existiam e só são registrados no mapa
        mapa.registrar("Hotel Abandonado", serpo);
        mapa.registrar("Túnel Abandonado", vovo);

        // Mesmo método investigar() para todos, mas cada ser se manifesta do seu jeito
        mapa.investigar("Hotel Abandonado");
        mapa.investigar("Túnel Abandonado");

        // Local que não foi registrado: cai no caso do local tranquilo
        mapa.investigar("Escola");
    }
}

// Interface: define o contrato, quem implementar é obrigado a ter manifestar()
interface Sobrenatural {
    void manifestar();
}

// Alienígena e espírito não têm nada em comum além da interface,
// por isso aqui usamos interface e não classe abstrata
class Alienigena implements Sobrenatural {

    // Encapsulamento
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    // Implementação do método da interface
    @Override
    public void manifestar(){
        System.out.println("Olá, Sou " + nome + "! Gosto de passear pela cidade.");
    }

    @Override
    public String toString() {
        return nome;
    }

}

class EspiritoYoukai implements Sobrenatural {

    // Encapsulamento
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    // Implementação do método da interface
    @Override
    public void manifestar(){
        System.out.println("Olá, Sou " + nome + "! Gosto de vagar nesse mundo.");
    }

    // Mesmo motivo do toString do Alienigena
    @Override
    public String toString() {
        return nome;
    }

}


class MapaDeAvistamentos{

    // HashMap: chave = nome do local (String), valor = ser (Sobrenatural)
    // como o tipo é a interface, aceita Alienigena, EspiritoYoukai ou qualquer outro
    private HashMap<String, Sobrenatural> avistamentos;

    // Construtor sem parâmetros: o mapa nasce vazio
    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    // put(chave, valor) guarda o ser usando o local como chave
    public void registrar(String local, Sobrenatural ser) {
        this.avistamentos.put(local, ser);
        System.out.println("[Registro] Local: " + local + "| Ser: " + ser);
    }

    public void investigar(String local) {

    // get(chave) devolve o ser do local, ou null se não tiver nada registrado
    Sobrenatural ser = this.avistamentos.get(local);

      if (ser == null) {
        System.out.println("O local '" + local + "' está tranquilo. Nenhum ser avistado.");
      }

      else {
        System.out.print("[" + local + "] ");
        // Polimorfismo: chama manifestar() sem saber se é alienígena ou espírito
        ser.manifestar();
      }
    }

}