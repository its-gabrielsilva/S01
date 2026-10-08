using System;
using System.Collections.Generic;

// Fazer a classe base
public class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine("Atacou com Investida!");
    }
}

// TipoPlanta herda de Pokemon
public class TipoPlanta : Pokemon
{
    // Repassa espécie e nível pro construtor do pai
    public TipoPlanta(string especie, int nivel) : base(especie, nivel) { }

    public override void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine("Atacou com Folha Navalha!");
    }
}

// TipoEletrico herda de Pokemon
public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel) { }

    // Soltar primeiro o ataque normal e depois a descarga
    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine("E soltou uma descarga elétrica: Trovoada!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibição Pokémon ===");

        // Lista do tipo da classe mãe
        List<Pokemon> pokemons = new List<Pokemon>();

        // Colocar um pokemon de cada classe
        pokemons.Add(new TipoPlanta("Sceptile", 50));
        pokemons.Add(new TipoEletrico("Electivire", 48));
        pokemons.Add(new Pokemon("Eevee", 25));

        // Rodar os ataques
        foreach (var p in pokemons)
        {
            p.Atacar();
        }

        Console.WriteLine("\n=== Fim da Exibição ===");
    }
}