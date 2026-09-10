package main

import "fmt"

// Funcao que recebe uma string, retorna um bool e uma string
func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Código de rastreio registrado no sistema!"
	}
	return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	// Declarar variaveis
	var codigo string
	var valido bool
	var mensagem string

	// Fazer o laço que repete até a função retornar true
	for {
		fmt.Print("Digite o código de rastreio: ")
		fmt.Scanln(&codigo)

		valido, mensagem = ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)

		if valido {
			break
		}
	}
}
