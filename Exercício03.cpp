#include <iostream>
#include <string>
using namespace std;

// Fazer classe base
class MembroInatel {
public:
    string nome;

    // Fazer o metodo virtual para poder sobrescrever as classes filhas
    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }
};

// Aluno herda de MembroInatel
class Aluno : public MembroInatel {
public:
    string curso;

    // Sobrescrever
    void seApresentar() override {
        cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

// Professor herda de MembroInatel
class Professor : public MembroInatel {
public:
    string disciplina;

    // Sobrescrita
    void seApresentar() override {
        cout << "Meu nome é " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    // Instanciar um Aluno e um Professor
    Aluno aluno;
    Professor professor;

    // Atribuir valores aos atributos
    aluno.nome = "Gabriel Silva";
    aluno.curso = "Engenharia de Software";

    professor.nome = "Ruan Patrick";
    professor.disciplina = "Paradigmas da Programação";

    // Chamar a funcao de cada objeto
    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}