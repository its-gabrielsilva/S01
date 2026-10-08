using System;
using System.Collections.Generic;

// Fazer o grimório
public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    // Mostrar o feitiço favorito
    public void Abrir()
    {
        Console.WriteLine($"\nO grimório se abre e revela o feitiço favorito: {FeiticoFavorito}");
    }
}

// Fazer o companheiro
public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
        Console.WriteLine($"[Companheiro] {Nome} ({Funcao}) existe e segue seu caminho.");
    }

    public void Apresentar()
    {
        Console.WriteLine($"- {Nome}, {Funcao}");
    }
}

// Fazer a maga
public class Maga
{
    public string Nome { get; set; }

    public Grimorio Grimorio { get; private set; }

    // Lista privada: ninguém de fora mexe nela direto, só pelo Recrutar()
    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;

        // Grimório criado AQUI DENTRO do construtor (composição)
        this.Grimorio = new Grimorio();

        this._companheiros = new List<Companheiro>();
        Console.WriteLine($"\n[Maga] {Nome} foi criada junto com o seu grimório.");
    }

    // O companheiro é criado FORA e só chega aqui como parâmetro (agregação)
    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
        Console.WriteLine($"[Maga] {c.Nome} entrou no grupo de {Nome}.");
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo de {Nome} ({_companheiros.Count} companheiros):");

        foreach (var c in _companheiros)
        {
            c.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== A Jornada de Frieren ===\n");

        // Criar os dois companheiros ANTES da maga
        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        // Criar a maga com o grimório junto
        Maga frieren = new Maga("Frieren");

        // Recrutar os dois
        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        // Definir o feitiço favorito do grimório
        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();

        // COMPOSIÇÃO: o Grimorio da Maga. Ele é criado dentro do construtor
        // da Maga (new Grimorio()), então nasce junto com ela e não faz sentido
        // existir sem ela. Se a Frieren deixasse de existir, o grimório iria junto.
        //
        // AGREGAÇÃO: os Companheiros da Maga. Fern e Stark foram criados na Main,
        // ANTES da Frieren, e a Maga só guarda uma referência a eles na lista.
        // Se a Frieren deixasse de existir, os dois continuariam existindo.

        Console.WriteLine("\n=== Fim da Jornada ===");
    }
}