# Relatório de Uso de IA

## Identificação

| Campo | Informação |
|---|---|
| **Nome completo** | Gabriel Silva Lopes |
| **Matrícula** | 749 |

## Modelo Utilizado

**Ferramenta:** Claude (Anthropic)

---

## Histórico de Prompts e Respostas

### Prompt 1

**Prompt enviado:**

> Como fazer um array de tamanho variável em C++

**Resposta obtida:**

Foram apresentadas três formas de se ter um array de tamanho variável em C++:

**1. `std::vector`** — a opção recomendada, pois gerencia a memória automaticamente:

```cpp
#include <vector>

int tamanho;
std::cin >> tamanho;

std::vector<int> arr(tamanho);

for (int i = 0; i < tamanho; i++) {
    arr[i] = i * 2;
}

arr.push_back(100); // pode crescer depois
```

**2. Alocação dinâmica com `new[]`** — controle manual da memória, exigindo `delete[]` para evitar vazamento:

```cpp
int* arr = new int[tamanho];
// ... usar o array ...
delete[] arr; // obrigatório
```

**3. `std::unique_ptr<int[]>`** — um meio-termo, aloca dinamicamente mas libera a memória sozinho ao sair de escopo:

```cpp
#include <memory>
std::unique_ptr<int[]> arr(new int[tamanho]);
```

Foi indicado que, na prática, `std::vector` é o padrão moderno recomendado, por ser mais seguro e contar com mais funcionalidades (redimensionar, inserir, remover, ordenar etc.), enquanto `new[]`/`delete[]` só costuma ser necessário em contextos de aprendizado de ponteiros ou onde `vector` não pode ser usado.

---

### Prompt 2

**Prompt enviado:**

> Tem uma maneira mais dinamica de quebrar a linha no c++

**Resposta obtida:**

Como a pergunta era ambígua, foram explicadas duas interpretações possíveis:

**1. Inserir quebra de linha ao imprimir**, com a diferença entre `"\n"` e `std::endl`:

```cpp
std::cout << "Olá" << "\n";       // mais rápido, recomendado
std::cout << "Olá" << std::endl;   // mais lento, força o flush do buffer
```

Foi explicado que `std::endl` força a limpeza do buffer de saída a cada chamada, o que é mais custoso em loops, sendo `"\n"` preferível na maioria dos casos.

**2. Quebra automática de texto (word wrap)**, para dividir um texto longo em várias linhas respeitando uma largura máxima:

```cpp
#include <sstream>
#include <string>

void imprimirComQuebra(const std::string& texto, int largura) {
    std::istringstream stream(texto);
    std::string palavra, linha;

    while (stream >> palavra) {
        if (linha.length() + palavra.length() + 1 > largura) {
            std::cout << linha << "\n";
            linha = palavra;
        } else {
            linha += (linha.empty() ? "" : " ") + palavra;
        }
    }
    if (!linha.empty()) std::cout << linha << "\n";
}
```

Essa função quebra o texto em palavras inteiras, sem cortar palavras no meio, respeitando um limite de caracteres por linha.

---

## Relatório de Aprendizado

O uso da IA nesse relatório me ajudou em: como criar arrays de tamanho variável em C++ e como lidar com quebras de linha de forma mais dinâmica.

**Como a resposta ajudou:**

A resposta mostrou as diferentes formas de alocar um array de tamanho variável em C++, comparando `std::vector`, `new[]`/`delete[]` e `std::unique_ptr<int[]>`. Também esclareceu como deixar a quebra de linha mais curta.

**Como isso solucionou minha dúvida:**

Entendi que `std::vector` é a forma mais segura e prática de trabalhar com arrays de tamanho variável em C++, e que "quebrar linha" pode significar tanto usar `\n`/`std::endl`.

**O que aprendi para aplicar em problemas futuros:**

Aprendi a diferença entre gerenciamento manual de memória (`new[]`/`delete[]`) e gerenciamento automático (`std::vector`, `std::unique_ptr`), além de quando usar `"\n"` em vez de `std::endl` por questões de desempenho.
