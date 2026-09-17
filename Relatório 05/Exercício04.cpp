#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int matriz_solar[5][5]; 	// Matriz 5x5
    int opcao;					// Opcao escolhida pelo usuario

    // Inicializa todas as celulas como inativas (0)
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            matriz_solar[i][j] = 0;
        }
    }
    
    do {
        // Exibir o menu de opcoes
        cout << "\n=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao; // Le a opcao escolhida pelo usuario

        if (opcao == 1) {
            // Ativar Celula
            // Ler a fileira e coluna
            int f, c;
            cout << "\nDigite a fileira (0-4): ";
            cin >> f;
            cout << "Digite a coluna (0-4): ";
            cin >> c;

            if (matriz_solar[f][c] == 0) {
                matriz_solar[f][c] = 1; // Ativa a celula
                cout << "Sucesso: Celula solar ativada!" << endl;
            } else {
                cout << "Erro: Celula solar ja esta em operacao!" << endl;
            }

        } else if (opcao == 2) {
            // Exibir o mapa visual da matriz
            cout << "\n--- Mapa da Matriz Solar ---" << endl;
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << matriz_solar[i][j] << "] ";
                }
                cout << endl;
            }

        } else if (opcao == 3) {
            // Calcular o relatorio final
            int ativas = 0;
            int inativas = 0;

            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    if (matriz_solar[i][j] == 1) {
                        ativas++;
                    } else {
                        inativas++;
                    }
                }
            }

			// Calcular o percentual em operacao
            float percentual = (ativas / 25.0) * 100;

            cout << "\n=== RELATORIO FINAL DE OPERACAO ===" << endl;
            cout << "Total de celulas ATIVAS: " << ativas << endl;
            cout << "Total de celulas INATIVAS: " << inativas << endl;
            cout << fixed << setprecision(2);
            cout << "Capacidade Operacional: " << percentual << "%" << endl;

        } else {
            cout << "\nOpcao invalida! Tente novamente." << endl;
        }

    } while (opcao != 3);

    return 0;
}