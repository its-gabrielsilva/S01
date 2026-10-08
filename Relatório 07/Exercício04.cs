using System;
using System.Collections.Generic;

// Fazer a classe base
public class EntidadeCosmica
{
    public string Nome { get; set; }

    // Começar "Desconhecida" e a Main pode definir depois
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
        Console.WriteLine($"[Registro] A entidade {Nome} foi registrada nos arquivos.");
    }

    // Virtual pra deixar as filhas reescreverem o jeito de se manifestar
    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");

        // Só mostra a origem se ela for conhecida
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// Profundo herda de EntidadeCosmica
public class Profundo : EntidadeCosmica
{
    // Repassa o nome pro construtor do pai
    public Profundo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Emerge das águas profundas, com um coaxar que gela a espinha.");
    }
}

// MiGo herda de EntidadeCosmica
public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine("Zumbe com suas asas membranosas enquanto examina tudo com curiosidade fria.");
    }
}

// Fazer o pesquisador
public class Pesquisador
{
    public string Nome { get; set; }

    // Fazer lista privada
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
        Console.WriteLine($"\n[Pesquisador] {Nome} abriu o catálogo da biblioteca.");
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
        Console.WriteLine($"[Pesquisador] {e.Nome} foi catalogada por {Nome}.");
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n{Nome} lê o catálogo ({_catalogo.Count} entidades):");

        foreach (var e in _catalogo)
        {
            e.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===\n");

        // Uma entidade de cada classe
        EntidadeCosmica azathoth = new EntidadeCosmica("Azathoth");
        Profundo dagon = new Profundo("Dagon");
        MiGo fungoDeYuggoth = new MiGo("Fungo de Yuggoth");

        // Definir a origem de duas entidades
        azathoth.Origem = "Centro do universo";
        fungoDeYuggoth.Origem = "Yuggoth";

        Pesquisador armitage = new Pesquisador("Henry Armitage");

        // Catalogar todas
        armitage.Catalogar(azathoth);
        armitage.Catalogar(dagon);
        armitage.Catalogar(fungoDeYuggoth);

        armitage.LerCatalogo();

        Console.WriteLine("\n=== Fim da Leitura ===");
    }
}