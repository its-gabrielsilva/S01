# Módulo de contrato
module Depoente
  def depor
    raise NotImplementedError, "#{self.class} deve implementar depor"
  end
end

# Módulo com implementação pronta
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard!"
  end
end


# Classe base
class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end


# Herança + módulo, a testemunha só inclui Depoente
class TestemunhaOcular < Envolvido
  include Depoente

  # Implementa o contrato do Depoente
  def depor
    puts "#{nome} (testemunha) diz: vi um homem de casaco preto saindo pela porta dos fundos."
  end
end


# Herança + dois módulos, o suspeito depõe e também pode ser detido
class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  attr_reader :alibi

  # O Envolvido só recebe nome, então o suspeito precisa de um initialize próprio
  # para guardar o álibi, e usa super para repassar o nome ao pai
  def initialize(nome, alibi)
    super(nome)
    @alibi = alibi
  end

  # Implementa o contrato do Depoente
  def depor
    puts "#{nome} (suspeito) diz: #{alibi}"
  end
end


# Agregação a investigação guarda referências a envolvidos que já existiam fora dela
class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  # Adiciona um envolvido já criado ao array
  def registrar(envolvido)
    @envolvidos << envolvido
  end

  # Polimorfismo, o mesmo depor para todos, cada um executa o seu
  def ouvir_todos
    puts "\n--- Investigação: #{@caso} ---"
    @envolvidos.each do |e|
      e.depor
    end
  end

  # Introspecção, verifica se o objeto possui aquele método
  # só os suspeitos passam, pois só eles incluem o módulo Detivel
  def acionar_scotland_yard
    puts "\n--- Scotland Yard acionada ---"
    detiveis = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detiveis.each do |d|
      d.ser_detido
    end
  end
end


# Main

# Os envolvidos são criados antes da investigação
testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Moriarty", "estava jogando xadrez em casa")
suspeito2 = SuspeitoDoCrime.new("Sebastian Moran", "estava caçando no campo")

investigacao = Investigacao.new("O Mistério da Baker Street")

investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard