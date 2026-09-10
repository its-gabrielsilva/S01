package main

import "fmt"

// Funcao que recebe a quantidade de plantoes
func gerarEscalaPlantao(n int) {
	fmt.Println("\n--- Escala de Plantão Técnico ---")

	dia := 1

	for i := 1; i <= n; i++ {
		fmt.Printf("Plantão %d: Dia %d do mês\n", i, dia)

		dia += 4
	}
}

func main() {
	// Quantidade de plantoes do usuario
	var n int

	fmt.Print("Digite a quantidade de plantões necessários: ")
	fmt.Scanln(&n)

	// Usa a funcao para exibir o resultado
	gerarEscalaPlantao(n)
}