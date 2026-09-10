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

> Como verifico o tamanho de uma string em Go?

**Resposta obtida:**

Em Go, usa-se a função `len()` para obter o tamanho de uma string:

```go
package main

import "fmt"

func main() {
    s := "Olá, mundo!"
    fmt.Println(len(s))
}
```

Foi destacado que `len()` retorna o número de **bytes**, não o número de caracteres (runes), o que faz diferença com caracteres multibyte, como acentos ou emojis, que ocupam mais de 1 byte em UTF-8. Exemplo:

```go
s := "Olá"
fmt.Println(len(s)) // 4 (o "á" ocupa 2 bytes em UTF-8)
```

Para contar o número real de caracteres (runes), a resposta indicou o uso do pacote `unicode/utf8`:

```go
package main

import (
    "fmt"
    "unicode/utf8"
)

func main() {
    s := "Olá"
    fmt.Println(utf8.RuneCountInString(s)) // 3
}
```

Também foi apresentada a alternativa de converter a string para `[]rune`:

```go
fmt.Println(len([]rune(s))) // 3
```

---

### Prompt 2

**Prompt enviado:**

> Como fazer um while (true) em Go?

**Resposta obtida:**

Foi explicado que Go não possui a palavra-chave `while`, mas que um loop infinito pode ser simulado com `for` sem condições:

```go
for {
    // código aqui
    // use "break" para sair do loop
}
```

Exemplo prático apresentado:

```go
package main

import "fmt"

func main() {
    i := 0
    for {
        if i >= 5 {
            break
        }
        fmt.Println(i)
        i++
    }
}
```

Também foi mostrada a forma `for true`, mais próxima sintaticamente de um `while`, mas apontada como incomum em Go (o idiomático é `for {}` puro, sendo que o `go vet` pode inclusive reclamar do `for true` como redundante):

```go
for true {
    // código aqui
}
```

Por fim, foi mencionado o uso de `for` com uma condição normal, equivalente ao `while` tradicional:

```go
for condicao {
    // executa enquanto condicao for true
}
```

---

## Relatório de Aprendizado

O uso da IA nesse relatório me ajudou em: como verificar o tamanho de uma string e como simular um loop `while(true)` na linguagem Go.

**Como a resposta ajudou:**

A resposta mostrou que `len()` em Go mede bytes, o que dá pra usar para medir o tamanho de um código de números (como no exercício 01). Também mostrou que Go não tem `while`, e que o loop pode ser feito com o `for {}`.

**Como isso solucionou minha dúvida:**

Entendi que posso usar `len()` para medir o tamanho de um código, e que devo usar `for {}` em vez de tentar replicar a sintaxe de `while`.

**O que aprendi para aplicar em problemas futuros:**

Aprendi a diferença entre tamanho em bytes e número de caracteres em strings Go, o que é importante ao trabalhar com texto em português (com acentuação) ou números. Também aprendi o padrão idiomático de Go para loops infinitos.
