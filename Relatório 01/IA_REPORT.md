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

> Como declarar uma variável real usando Basic

**Resposta obtida:**

Em Basic (dependendo do dialeto), você declara uma variável do tipo real (ponto flutuante) assim:

**QBasic / QuickBASIC**

```basic
DIM numero AS SINGLE
DIM numero2 AS DOUBLE
```

- `SINGLE`: precisão simples (4 bytes)
- `DOUBLE`: precisão dupla (8 bytes)

Você também pode usar o sufixo de tipo diretamente no nome da variável, sem precisar do `DIM`:

```basic
numero! = 3.14       ' ! indica SINGLE
numero# = 3.14159265 ' # indica DOUBLE
```

**Visual Basic (VB.NET)**

```vb
Dim numero As Single
Dim numero2 As Double
```

**Exemplo prático**

```basic
DIM raio AS SINGLE
DIM area AS DOUBLE

raio = 5.5
area = 3.14159 * raio * raio

PRINT "A área é: "; area
```

> Se você está usando um dialeto específico de Basic (GW-BASIC, FreeBASIC, VBA, etc.), me avisa que ajusto o exemplo — a sintaxe muda um pouco entre eles.

---

### Prompt 2

**Prompt enviado:**

> No C++ existe o endl para mostrar que é pra pular de linha. Qual seria esse comando no basic

**Resposta obtida:**

No BASIC, o `PRINT` já pula de linha automaticamente no final, ao contrário do `cout` em C++ que precisa do `endl` explícito. Mas existem algumas situações e formas de controlar isso:

**Pular linha (equivalente ao `endl`)**

QBasic/QuickBASIC:

```basic
PRINT "Olá"        ' já pula linha sozinho
PRINT              ' PRINT vazio = pula uma linha em branco
```

Se quiser controlar manualmente, dá pra usar o caractere de nova linha:

```basic
PRINT "Olá"; CHR$(10);
```

**Impedir o pulo de linha (o oposto)**

Se você quiser que o `PRINT` não pule linha (tipo o `cout` sem `endl`), use `;` no final:

```basic
PRINT "Olá ";
PRINT "Mundo"
```

Isso imprime `Olá Mundo` na mesma linha.

**Visual Basic (VB.NET)**

```vb
Console.WriteLine("Olá")     ' equivalente a cout + endl
Console.Write("Olá")         ' equivalente a cout sem endl
```

Ou usando a constante `vbCrLf` dentro de uma string:

```vb
Console.Write("Olá" & vbCrLf & "Mundo")
```

**Resumo da lógica**

| C++ | BASIC |
|---|---|
| `cout << "texto" << endl;` | `PRINT "texto"` |
| `cout << "texto";` (sem pular) | `PRINT "texto";` |
| `cout << endl;` | `PRINT` (vazio) |

> Se estiver usando um dialeto específico, me fala qual que eu confirmo a sintaxe certinha.

---

### Prompt 3

**Prompt enviado:**

> No c++ existe o setprecion(x) para definir a quantidade de numeros decimais, qual seria esse comando no basic

**Resposta obtida:**

No BASIC, não existe um comando idêntico ao `setprecision`, mas você controla a quantidade de casas decimais usando a formatação com `PRINT USING`.

**QBasic / QuickBASIC — `PRINT USING`**

```basic
DIM numero AS DOUBLE
numero = 3.14159265

PRINT USING "#.##"; numero        ' mostra 3.14 (2 casas decimais)
PRINT USING "#.####"; numero      ' mostra 3.1416 (4 casas decimais)
```

Cada `#` depois do ponto representa uma casa decimal.

**Exemplo prático**

```basic
DIM raio AS SINGLE
DIM area AS DOUBLE

raio = 5.5
area = 3.14159 * raio * raio

PRINT USING "A área é: ##.##"; area
```

Isso limita a saída a 2 casas decimais, parecido com `cout << setprecision(2) << area;` (no modo `fixed`).

**Visual Basic (VB.NET)**

```vb
Dim numero As Double = 3.14159265

Console.WriteLine(numero.ToString("F2"))   ' 2 casas decimais -> 3.14
Console.WriteLine(numero.ToString("F4"))   ' 4 casas decimais -> 3.1416
```

O `"F2"` funciona como o `setprecision` fixo do C++.

**Resumo da comparação**

| C++ | BASIC (QBasic) | VB.NET |
|---|---|---|
| `setprecision(2) << fixed` | `PRINT USING "#.##"` | `.ToString("F2")` |
| `setprecision(4) << fixed` | `PRINT USING "#.####"` | `.ToString("F4")` |

> Se for pra um exercício específico, me manda o dialeto que você tá usando (QBasic, FreeBASIC, etc.) que confirmo a sintaxe exata.

---

## Relatório de Aprendizado

O uso da IA nesse relatório serviu principalmente para traduzir conceitos que eu já conhecia em C++ para a sintaxe equivalente em BASIC.

**Como as respostas ajudaram:**

- No primeiro prompt, a IA esclareceu como declarar variáveis reais em BASIC (`SINGLE` e `DOUBLE`).
- No segundo prompt, a resposta esclareceu uma diferença conceitual importante: em C++ o `cout` não pula linha por padrão, enquanto em BASIC o `PRINT` já pula linha automaticamente, sendo o `;` o que evita esse comportamento.
- No terceiro prompt, aprendi que BASIC não tem um comando direto equivalente ao `setprecision`, mas que pode ser feito por `PRINT USING`, usando o caractere `#` para representar cada casa decimal.

**O que aprendi para aplicar em problemas futuros:**

Entendi que ao migrar de uma linguagem para outra, não basta procurar "comandos equivalentes" um a um, muitas vezes o paradigma de solução é diferente. Isso me deixou mais atento a comparar o comportamento das linguagens, e não só a sintaxe, antes de escrever código.
