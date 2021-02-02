
# i = 1
# 5.times do
#   puts "Execução numero #{i}"
#   i = i + 1
# end

bandas = ["Aerosmith", "Só pra contrariar", "Claudinho e Buchecha", "Guns n Roses", "Raimundos"]

# i = 0
# bandas.size.times do
#   puts bandas[i]
#   i = i + 1
# end

bandas.each do |banda|
  puts banda
end
