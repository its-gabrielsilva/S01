#include <iostream>
#include <iomanip>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++) {
        confiabilidade *= probabilidades[i];
    }

    return confiabilidade;
}

int main() {
    // Declarar quantidade de componentes
    int n;

    // Ler o valor de n
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    // Armazenar as probabilidades
    float* probabilidades = new float[n];

     // Ler a probabilidade de cada componente
    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    // Usar a funcao para calcular a confiabilidade
    float resultado = calcular_confiabilidade_sistema(probabilidades, n);

    // Mostrar o resultado calculado
    cout << fixed;
    cout << setprecision(4) << "Confiabilidade total do sistema: " << resultado
         << setprecision(2) << " (" << (resultado * 100) << "%)" << endl;

    delete[] probabilidades;

    return 0;
}