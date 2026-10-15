from abc import ABC, abstractmethod

# usa ABC pra simular a interface
# toda classe que herdar de IUnidadeDeRede terá executar_invasao()
class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


# parte composta
# Cyberdeck é só um molde com o modelo
class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


# implementação com composição
# OperadorNetrunner implementa IUnidadeDeRede
class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        # composição: o Cyberdeck é criado DENTRO do __init__ do netrunner
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"<{self.nome}> usa o cyberdeck {self.cyberdeck.modelo} "
              f"e está quebrando o gelo (ICE) de um servidor.")


# implementação
# DroneDeVigilancia também implementa IUnidadeDeRede
class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"<{self.codigo}> está interceptando o sinal da rede.")


# agregação
# CelulaHacker guarda referências para membros que já existiam
class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        # agregação: a lista de membros é criada FORA e apenas recebida
        self.membros = membros

    def iniciar_ataque(self):
        print(f"--- Célula {self.nome} iniciando o ataque ---")
        # polimorfismo
        # mesma chamada, comportamento diferente dependendo do membro
        for membro in self.membros:
            membro.executar_invasao()


if __name__ == "__main__":
    print("--- Night City ---")

    # os membros são criados fora da célula
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DRN-07")

    celula = CelulaHacker("Afterlife", [netrunner, drone])
    celula.iniciar_ataque()

    # tentando criar um objeto da interface diretamente
    # unidade = IUnidadeDeRede()
    # gera: TypeError: Can't instantiate abstract class IUnidadeDeRede
    # without an implementation for abstract method 'executar_invasao'