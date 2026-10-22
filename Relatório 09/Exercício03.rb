# Composição, o PhoneWave só existe dentro do laboratório
# É criado pelo laboratório e nasce e morre junto com ele
class PhoneWave

  # Imprime a mensagem e avisa que ela foi enviada para o passado
  def enviar_dmail(mensagem)
    puts "D-Mail: \"#{mensagem}\""
    puts "Mensagem enviada para o passado!"
  end
end


# Agregação, o membro já existia antes de entrar no laboratório
# Se o laboratório sumir, o membro continua existindo
class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end


class LaboratorioDeGadgets

  # Composição: o PhoneWave é criado aqui dentro, o laboratório é dono dele
  # Agregação: membros começa vazio e guarda referências a membros criados fora
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  # Adiciona um membro já criado ao array e imprime o número e o nome dele
  def admitir(membro)
    @membros << membro
    puts "Lab Mem No. #{membro.numero} - #{membro.nome} foi admitido no laboratório."
  end

  # Imprime os membros presentes e depois envia o D-Mail pelo PhoneWave
  def experimento(mensagem)
    puts "\n--- Experimento iniciado ---"
    @membros.each do |m|
      puts "Presente: Lab Mem No. #{m.numero} - #{m.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end


# Main

# Os membros são criados antes do laboratório, eles existem por conta própria
okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new

lab.admitir(okabe)
lab.admitir(mayuri)

lab.experimento("Não confie na Organização.")


# COMPOSIÇÃO x AGREGAÇÃO neste programa
# Composição: o PhoneWave. Ele é criado dentro do initialize do LaboratorioDeGadgets
# e só existe dentro dele, ou seja, se o laboratório deixar de existir, o PhoneWave também.
# Agregação: os MembroDoLab. Eles são criados na main, antes do laboratório,
# e o laboratório apenas guarda referências a eles no @membros.
# Se o laboratório sumir, okabe e mayuri continuam existindo.