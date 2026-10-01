#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    // Declarar atributos
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    // Criar o método duelar
    void duelar(Banda &rival) {
        cout << nome << " se apresentou e desafiou " << rival.nome
             << " com " << potenciaSom << " de potencia de som!" << endl;
        rival.energia -= potenciaSom;
    }

    // Exibir o status atual da banda
    void exibirStatus() {
        cout << "Banda: " << nome
             << " | Integrantes: " << integrantes
             << " | Potencia de som: " << potenciaSom
             << " | Energia da plateia: " << energia << endl;
    }
};

int main() {
    // Instanciar os 2 objetos
    Banda banda1, banda2;

    // Atribuir valores personalizados
    banda1.nome = "AC/DC";
    banda1.integrantes = 5;
    banda1.potenciaSom = 37.0f;
    banda1.energia = 100;

    banda2.nome = "Guns N' Roses";
    banda2.integrantes = 7;
    banda2.potenciaSom = 25.0f;
    banda2.energia = 100;

    // banda1 é a desafiante e banda2 é a rival
    banda1.duelar(banda2);

    // Mostrar o status final de ambas
    cout << "\n=== Status apos o confronto ===" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}