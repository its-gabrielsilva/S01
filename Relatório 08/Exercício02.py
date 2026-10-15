# classe base
class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    # suprema genérica
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa uma suprema genérica.")


# heranca para o tanque
class HeroiTanque(HeroiOverwatch):

    # sobrescrita
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa sua suprema e avança "
              f"protegendo a equipe com uma barreira gigante!")


# heranca para o suporte
class HeroiSuporte(HeroiOverwatch):

    # sobrescrita
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa sua suprema e "
              f"potencializa toda a equipe!")

    # método exclusivo do suporte
    def curar_equipe(self):
        print(f"<{self.codinome}> cura toda a equipe.")


if __name__ == "__main__":
    print("--- Escolha de Heróis ---")

    # um herói de cada classe
    heroi_generico = HeroiOverwatch("Soldado", "Dano")
    heroi_tanque = HeroiTanque("Reinhardt", "Tanque")
    heroi_suporte = HeroiSuporte("Mercy", "Suporte")

    # polimorfismo, guarda os três herois
    herois: list[HeroiOverwatch] = [heroi_generico, heroi_tanque, heroi_suporte]

    print("\n--- Supremas ---")
    for heroi in herois:
        heroi.usar_suprema()

        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()