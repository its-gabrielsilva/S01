package main

import "fmt"

// Funcao que recebe o setor e o codigo do ingresso
func validarIngresso(setor string, codigo int) bool {
	if setor == "VIP" && codigo == 2026 {
		return true
	}
	return false
}

func main() {
	// Declarar variaveis
	var setor string
	var codigo int

	// Fazer o laço que repete até o acesso ser liberado
	for {
		// Inserir o setor
		fmt.Print("Digite o setor do ingresso: ")
		fmt.Scanln(&setor)

		// Inserir o codigo
		fmt.Print("Digite o código do ingresso: ")
		fmt.Scanln(&codigo)

		// Ver se o ingresso e valido ou nao
		if validarIngresso(setor, codigo) {
			fmt.Println("Acesso liberado à área VIP!")
			break 
		} else {
			fmt.Println("Ingresso ou setor inválido. Tente novamente.")
		}
	}
}