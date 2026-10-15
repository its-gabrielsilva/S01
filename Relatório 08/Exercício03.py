# classe simples
# Persona não herda de nada, é só um molde com nome e arcano
# vai ser criada dentro de Lider (isso é Composição)
class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    # exibe os dois dados da Persona
    def invocar(self):
        print(f"Persona invocada: {self.nome} (Arcano: {self.arcano})")


# agregação
# Aliado existe por conta própria, independente de qualquer Lider
# se o Lider sumir, o Aliado continua existindo
class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome            # nome real
        self.codinome = codinome    # apelido usado nas invasões


# classe do lider
class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        # composição: a Persona é criada dentro do __init__ do Lider
        self.persona = Persona("Arsène", "Louco")
        # a equipe começa vazia
        self._equipe = []

    # agregação: o Aliado é criado fora e apenas recebido como parâmetro
    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.nome} ({aliado.codinome}) foi recrutado por {self.codinome}.")

    # recebe o nome do dono do Palácio
    def infiltrar(self, palacio: str):
        print(f"\n{self.codinome} invadiu o Palácio de {palacio}!")
        self.persona.invocar()
        print("Equipe:")
        for aliado in self._equipe:
            print(f"- {aliado.nome} ({aliado.codinome})")


if __name__ == "__main__":
    print("--- Phantom Thieves ---")

    # agregação: os aliados são criados antes do líder
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")

    # COMPOSIÇÃO x AGREGAÇÃO NO MEU PROGRAMA
    # Composição (Lider e Persona): a Persona é criada dentro do __init__ do
    # Lider, então nasce junto com ele e só existe enquanto ele existir.
    # Não faz sentido ter a Arsène sem o Joker.
    # Agregação (Lider e Aliado): os Aliados (ryuji e ann) são criados fora,
    # antes do Lider, e só são recebidos por recrutar(). O Lider guarda apenas
    # uma referência a eles, então se o Lider sumir, os Aliados continuam existindo.