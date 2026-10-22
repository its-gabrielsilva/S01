# Classe base dos coqueteis
class CoquetelAfterlife

  # Encapsulamento  
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  # Getter manual
  def preco
    @_preco
  end

  # Setter manual, só atualiza o preco se o valor for entre 5 e 200
  def preco=(valor)
    if valor.is_a?(Numeric) && valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  # retorna o texto com nome e preço
  def ficha
    "Drink: #{nome} | Preço: #{preco}"
  end
end


# Herança, o drink de lenda é um coquetel, mas com uma lenda homenageada
class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda   # atributo exclusivo


  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # Sobrescrita, chama ficha do pai e acrescenta a lenda no final
  def ficha
    super + " | Em homenagem a: #{lenda}"
  end
end


# Array com um coquetel comum e dois drinks de lenda
drinks = [
  CoquetelAfterlife.new("Blue Moon", 40),
  DrinkDeLenda.new("Johnny Silverhand", 120, "Johnny Silverhand, o rockerboy"),
  DrinkDeLenda.new("Jackie Welles", 90, "Jackie Welles, o mercenário parceiro de V")
]

puts "--- Cardápio do Afterlife ---"
drinks.each do |d|
  puts d.ficha
end

# Testando o setter com um drink de lenda
lenda = drinks[1]

lenda.preco = 500      # Valor fora da faixa e mantém mesmo preço
puts lenda.ficha

lenda.preco = 80       # Atualiza o valor
puts lenda.ficha

# O nome não pode ser alterado de fora
# Descomentar essa linha gera NoMethodError (undefined method 'nome=')
#lenda.nome = "Morgan Blackhand"
