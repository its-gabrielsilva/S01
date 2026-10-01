#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Fazer classe base
class Hobbit {
protected:
    string nome;

public:
    // Construtor com lista de inicialização
    Hobbit(string n) : nome(n) {}

    // Metodo virtual para permitir o polimorfismo
    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " está aproveitando um dia tranquilo na Comarca." << endl;
    }

    // Destrutor virtual
    virtual ~Hobbit() {}
};

// Jardineiro herda de Hobbit
class Jardineiro : public Hobbit {
public:
    Jardineiro(string n) : Hobbit(n) {}

    // Sobrescrita
    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " está cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

// Cozinheiro herda de Hobbit
class Cozinheiro : public Hobbit {
public:
    Cozinheiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " está preparando o segundo café da manhã para os convidados!" << endl;
    }
};

// Fazendeiro herda de Hobbit
class Fazendeiro : public Hobbit {
public:
    Fazendeiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " está colhendo vegetais e hortaliças em suas terras!" << endl;
    }
};

int main() {
    // Vetor de ponteiros para a classe base
    vector<Hobbit*> hobbits;

    // Fazer uma instância de cada profissão, alocada dinamicamente
    hobbits.push_back(new Jardineiro("Sam"));
    hobbits.push_back(new Cozinheiro("Bilbo"));
    hobbits.push_back(new Fazendeiro("Maggot"));

    // Execução polimórfica
    for (Hobbit* h : hobbits) {
        h->fazerAtividade();
    }

    // Desalocação de memória
    for (Hobbit* h : hobbits) {
        delete h;
    }

    return 0;
}