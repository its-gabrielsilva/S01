# Classe base dos instrumentistas
# Abstração, define o que todo instrumentista tem, mas não como ele interpreta
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # Método abstrato, as classes filhas é que implementam
  def interpretar(peca)
    raise NotImplementedError, "#{self.class} deve implementar interpretar"
  end
end


# Herança, o solista é um instrumentista, usa o initialize do pai
class Solista < Instrumentista

  # Sobrescrita, o solista conduz a melodia principal
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} e interpreta #{peca}, conduzindo a melodia principal!"
  end
end


# Herança, o acompanhador também usa o initialize do pai
class Acompanhador < Instrumentista

  # Sobrescrita, o acompanhador segue o ritmo do solista
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} e interpreta #{peca}, acompanhando o ritmo do solista."
  end
end


# O regente guarda os instrumentistas que já existiam
class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  # Adiciona o instrumentista ao array
  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  # Polimorfismo, o mesmo interpretar para todos, cada um executa o seu
  def reger(peca)
    puts "\nA regente #{@nome} conduz a peça #{peca}"
    @orquestra.each do |i|
      i.interpretar(peca)
    end
  end

  # Cria um novo array de textos, um para cada instrumentista e retorna o nome da classe do objeto
  def escalacao
    @orquestra.map { |i| "#{i.class}: #{i.nome}" }
  end
end


# Main

solista = Solista.new("Kaori Miyazono", "violino")
acompanhador = Acompanhador.new("Kousei Arima", "piano")
regente = Regente.new("Hiroko Seto")

regente.convocar(solista)
regente.convocar(acompanhador)

regente.reger("Kreutzer Sonata")

puts "\n--- Escalação ---"
regente.escalacao.each do |texto|
  puts texto
end

# Cria o objeto Instrumentista direto, ele é criado normalmente
instrumentista = Instrumentista.new("Takeshi Aiza", "flauta")

# A chamada gera NotImplementedError, pois interpretar só existe no pai como contrato
#instrumentista.interpretar("Ode à Alegria")