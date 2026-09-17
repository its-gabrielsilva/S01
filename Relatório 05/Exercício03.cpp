#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    float capacidadeMaxima;     // Capacidade maxima
    float cargaAtual = 0.0;     // Peso atual carregado
    int opcao;                  // Opcao escolhida

    // Ler o valor da capacidade maxima
    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidadeMaxima;

    cout << fixed << setprecision(2);

    // Menu de opcoes
    do {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao; // Le a opcao escolhida pelo usuario

        if (opcao == 1) {
            // Verificar Carga Atual
            cout << "\nCarga Atual: " << cargaAtual << " kg / " << capacidadeMaxima << " kg" << endl;
            cout << "Espaco Disponivel: " << (capacidadeMaxima - cargaAtual) << " kg" << endl;

        } else if (opcao == 2) {
            // Carregar Pacote
            float peso;
            cout << "\nDigite o peso do pacote a ser carregado (kg): ";
            cin >> peso; // Le o peso do pacote

            if (cargaAtual + peso > capacidadeMaxima) {
                // Bloqueia se o peso ultrapassar a capacidade maxima
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } else {
                cargaAtual += peso; // Adiciona o peso a carga atual
                cout << "Pacote adicionado com sucesso!" << endl;
            }

        } else if (opcao == 3) {
            // Descarregar Pacote
            float peso;
            cout << "\nDigite o peso a ser removido (kg): ";
            cin >> peso; // Le o peso a ser removido

            if (peso > cargaAtual) {
                // Bloqueia se tentar remover mais do que o que esta carregado
                cout << "Alerta: Nao e possivel remover mais peso do que o carregado! Operacao cancelada." << endl;
            } else {
                cargaAtual -= peso; // Remove o peso da carga atual
                cout << "Pacote removido com sucesso!" << endl;
            }

        } else if (opcao == 4) {
            // Encerrar Operacao
            cout << "\nEncerrando sistema de telemetria..." << endl;

        } else {
            cout << "\nOpcao invalida! Tente novamente." << endl;
        }

    } while (opcao != 4);

    return 0;
}