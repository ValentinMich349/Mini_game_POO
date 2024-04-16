require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# binding.pry

#--------------INITIALIZATION-------------------------
player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "À ma gauche, la championne incontestée #{player1.name}, la buveuse de gentiane ! Tandis qu'à ma droite nous avons le challenger parfait #{player2.name}, toujours un coup dans le nez ! 
Préparez vos cacahuètes le combat vas être légendaire."
puts ""
puts "C'est parti pour le combat du siècle!!!"


while player1.life_points.positive? && player2.life_points.positive?
  puts 
  puts "-" * 58
  puts
  puts "Petit rappel de l'état de nos combattants"
  puts
  player1.show_state
  puts
  puts
  player2.show_state
  puts
  puts "-" * 58
  puts
  puts "Que les coups pleuvent à nouveaux"
  puts
  puts
    player1.attacks(player2)
    player2.life_points.positive? && player2.attacks(player1)   
end

if player1.life_points.negative?
    puts "\n #{player1.name} a perdu !"
    puts "Nous avons donc un nouveau champion !! Félicitation à #{player2.name}"
  else
    puts "\n #{player2.name} a perdu !"
    puts "Notre championne reste championne !! Un tonnerre d'applaudissement pour #{player1.name}"
  end
