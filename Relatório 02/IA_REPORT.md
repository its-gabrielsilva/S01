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

> Qual é a função de diferença absoluta em Lua

**Resposta obtida:**

Em Lua não existe uma função pronta específica para "diferença absoluta", mas você consegue isso facilmente combinando `math.abs()` com a subtração:

```lua
function diferencaAbsoluta(a, b)
    return math.abs(a - b)
end

print(diferencaAbsoluta(5, 8))   -- 3
print(diferencaAbsoluta(8, 5))   -- 3
print(diferencaAbsoluta(-3, 4))  -- 7
```

A função `math.abs(x)` retorna o valor absoluto de `x`, então basta subtrair os dois números e aplicar `math.abs()` no resultado — assim não importa a ordem dos argumentos, o resultado sempre será positivo (ou zero).

Se estiver usando Lua 5.4 (padrão hoje em dia), vale lembrar que `math.abs` funciona tanto com inteiros quanto com floats, preservando o tipo quando possível.

---

## Relatório de Aprendizado

O uso da IA nesse relatório serviu para esclarecer como calcular a diferença absoluta entre dois números em Lua.

**Como a resposta ajudou:**

A resposta me mostrou que usando a função `math.abs()` com uma subtração simples é possível calcular a diferença absoluta entre dois números.

**Como isso solucionou minha dúvida:**

Que quando uma linguagem não tem uma função pronta para um cálculo específico, ela pode ser construída combinando outras funções já existentes.

**O que aprendi para aplicar em problemas futuros:**

Aprendi que se pode combinar funções da biblioteca padrão para obter outras funções que não existem na linguagem.
