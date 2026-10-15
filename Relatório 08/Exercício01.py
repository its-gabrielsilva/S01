# classe base
class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        # encapsulamento
        self.nome = nome        # público
        self._almas = almas     # protegido
        self.__estus = estus    # privado

    # getter
    def get_estus(self):
        return self.__estus

    # setter
    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    # retorna um texto com os três dados
    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


# herança
class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    # sobrescrita
    def mostrar_status(self):
        return super().mostrar_status() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":
    print("--- Fogueira de Firelink ---")

    # cria um clerigo
    petrus = Clerigo("Petrus", 2000, 5, "Cura Maior")

    print("\n--- Status Inicial ---")
    print(petrus.mostrar_status())

    # tenta definir o Estus como 15
    print("\n--- Tentando definir Estus = 15 ---")
    petrus.set_estus(15)
    print(petrus.mostrar_status())

    # define o Estus como 10
    print("\n--- Tentando definir Estus = 10 ---")
    petrus.set_estus(10)
    print(petrus.mostrar_status())

    # tentando acessar o atributo privado diretamente
    # gera: AttributeError: 'Clerigo' object has no attribute '__estus'
    # o nome foi embaralhado pelo Python, então não é encontrado fora da classe
    # print(petrus.__estus)
