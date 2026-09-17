#include <iostream>
using namespace std;

// Funcao recursiva para calcular os confrontos possiveis
int combinar_equipes(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;

    return combinar_equipes(n - 1) + combinar_equipes(n - 2);
}

int main() {
    // Declarar o tamanho do chaveamento
    int n;

    // Ler o valor de n
    cout << "Digite o tamanho do chaveamento (n): ";
    cin >> n;

    // Usar a funcao para calcular a quantidade de confrontos
    cout << "Total de cenarios de confrontos possiveis: " << combinar_equipes(n) << endl;

    return 0;
}
