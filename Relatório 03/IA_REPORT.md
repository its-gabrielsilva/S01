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

> Como fazer um função de retorno absoluto em rust desse estilo: |palpite - numero_secreto| <= 5

**Resposta obtida:**

Em Rust, o método `.abs()` está disponível para tipos com sinal (`i32`, `i64`, `f64`, etc.). Para tipos sem sinal (`u32`), é preciso tomar cuidado, pois a subtração direta pode causar overflow caso o resultado seja negativo.

Para números `i32`:

```rust
fn dentro_do_intervalo(palpite: i32, numero_secreto: i32) -> bool {
    (palpite - numero_secreto).abs() <= 5
}
```

Para números `u32`, é necessário verificar qual valor é maior antes de subtrair, ou converter para `i32` antes de aplicar `.abs()`:

```rust
fn dentro_do_intervalo(palpite: u32, numero_secreto: u32) -> bool {
    (palpite as i32 - numero_secreto as i32).abs() <= 5
}
```

---

### Prompt 2

**Prompt enviado:**

> Como deixar um numero com uma precisão de 2 casas decimais fixas em rust?

**Resposta obtida:**

Existem duas abordagens em Rust, dependendo do objetivo:

**Para exibir** um número com 2 casas decimais (sem alterar o valor internamente), usa-se a formatação `{:.2}`:

```rust
let numero: f64 = 3.14159;
println!("{:.2}", numero); // imprime: 3.14
```

**Para arredondar de fato o valor** (não apenas na exibição), multiplica-se por 100, arredonda-se e divide-se novamente por 100:

```rust
let numero: f64 = 3.14159;
let arredondado = (numero * 100.0).round() / 100.0;
```

Foi destacado que, por `f64` usar ponto flutuante binário, o valor arredondado pode não ser exatamente representável internamente — para casos que exigem precisão decimal exata (como valores monetários), o ideal é usar uma crate como `rust_decimal` ou trabalhar com inteiros (ex: centavos).

---

## Relatório de Aprendizado

O uso da IA nesse relatório serviu para ajudar a calcular a diferença absoluta entre dois números e como usar a precisão decimal de um número.

**Como a resposta ajudou:**

A resposta mostrou que o método `.abs()` em Rust funciona, mas exige atenção ao tipo numérico utilizado. Também mostrou que existem duas formas distintas de trabalhar com casas decimais: formatar para exibição ou arredondar o valor armazenado.

**Como isso solucionou minha dúvida:**

Entendi que Rust exige cuidado com os tipos numéricos (com ou sem sinal) para evitar erros de overflow, e que a escolha entre exibir ou arredondar um número depende do que será feito com ele depois.

**O que aprendi para aplicar em problemas futuros:**

Aprendi a diferenciar formatação de exibição (`{:.2}`) de arredondamento real do valor, e a importância de verificar o tipo numérico (`i32` ou `u32`) antes de aplicar operações como subtração e valor absoluto, para evitar panics por overflow em Rust.
