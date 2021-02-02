class Veiculo
  attr_accessor :nome, :cor, :marca

  def initialize(nome, marca)
    @nome = nome
    @marca = marca
  end

  def define_cor(cor)
    @cor = cor
  end
end

class Carro < Veiculo
  def ligar
    puts "O #{@nome} está pronto para iniciar o trajeto"
  end

  def dirigir
    puts "O #{nome} está iniciando o trajeto"
  end
end

class Moto < Veiculo
  def ligar
    puts "A #{@nome} está pronto para iniciar o trajeto"
  end

  def pilotar
    puts "A #{nome} está iniciando o trajeto"
  end
end

chevette = Carro.new("Chevette", "GM")
chevette.define_cor("bege")
cg = Moto.new("CG", "Honda")
cg.define_cor("verde")
chevette.ligar
chevette.dirigir
cg.ligar
cg.pilotar
