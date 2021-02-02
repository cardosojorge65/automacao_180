
puts "Qual seu nome?"

nome = gets.chomp

puts "Informe sua idade"
idade = gets.chomp.to_i

if (idade >= 18)
  puts "#{nome}, você tem #{idade} e portanto pode tirar sua carteira de motorista"
elsif (idade > 7)
  puts "#{nome}, você tem #{idade} , melhor continuar andando de bicicleta"
else
  puts "#{nome}, você tem #{idade},  melhor andar de tonquinha"
end
