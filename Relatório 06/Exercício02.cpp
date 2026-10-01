#include <iostream>
#include <string>
using namespace std;

class LinkSocial {
private:
    // Declarar atributos
    string nome;
    string arcana;
    int rank;

// Criar metodos publicos
public:
    // Getters (acesso)
    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    // Setters (modificação)
    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    // Incrementar o rank em +1
    void subirRank() {
        rank++;
    }
};

int main() {
    // Instanciar o objeto
    LinkSocial link;

    // Definir os valores usando os setters
    link.setNome("Junpei Iori");
    link.setArcana("Magician");
    link.setRank(1);

    // Subir o rank
    link.subirRank();

    // Exibir os dados usando os getters
    cout << "=== Link Social ===" << endl;
    cout << "Personagem: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}