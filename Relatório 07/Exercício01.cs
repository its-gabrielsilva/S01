using System;

// Fazer a classe do combatente
public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public int Circulo { get; private set; }

    // Todo mundo começa desarmado até alguém equipar
    public string Armamento { get; private set; } = "Desarmado";

    // Construtor para preencher tudo na hora que o combatente é criado
    public CombatenteDeGondor(string nome, string povo, string posto, int circulo)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        this.Circulo = circulo;
        Console.WriteLine($"[Convocação] {Nome} foi convocado para a defesa de Minas Tirith.");
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");
        Console.WriteLine($"Círculo: {Circulo}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===\n");

        // Fazer três combatentes
        CombatenteDeGondor legolas = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro", 1);
        CombatenteDeGondor peregrin = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela", 7);
        CombatenteDeGondor beregond = new CombatenteDeGondor("Beregond", "Homem de Gondor", "Capitão da Guarda", 6);

        // Equipar dois combatentes
        legolas.Equipar("Arco dos Galadhrim");
        beregond.Equipar("Espada e Escudo de Gondor");

        // Apresentar todos combatentes
        legolas.ApresentarUnidade();
        peregrin.ApresentarUnidade();
        beregond.ApresentarUnidade();

        // Tentei mudar o Posto aqui e deu erro de compilação (CS0272),
        // porque o set é private. Deixei comentado.
        // peregrin.Posto = "Capitão";

        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}