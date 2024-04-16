require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# binding.pry

puts
puts "|" + "-" * 57 + "|"
puts "|" + " Bienvenue sur 'ILS VEULENT TOUS MA POO' ! " + " " *14 + "|"
puts "|" + " Le but du jeu est d'être le dernier survivant ! " + " " * 8 + "|"
puts "|" + "-" * 57 + "|"

#--------------INITIALIZATION HUMAN PLAYER-------------------------

puts "Quel est ton nom de guerrier ?"
print ">"
user = HumanPlayer.new(gets.chomp)
titre = "le guerrier assoiffé"
complet_name = user.name + ", " + titre
puts "Votre nom de guerrier est #{user.name}, et tu aura pour titre #{titre} !!"
puts
puts "Bienvenue a toi alors #{complet_name}"

#--------------INITIALIZATION ROBOT PLAYER-------------------------

all_robots = []

robot1 = Player.new("Josiane")
robot2 = Player.new("José")

all_robots.push(robot1,robot2)

while user.life_points.positive? && (robot1.life_points.positive? || robot2.life_points.positive?)
    puts "-" * 57
    puts 
    puts "petit rappel de l'état de santé de notre héro du jour"
    puts
    puts user.show_state_v2
    puts 
    puts "-" * 57
    puts
    puts "petit rappel de l'état de tes adversaires"
    puts robot1.show_state
    puts robot2.show_state
    puts
    puts "-" * 57
    puts
    puts " Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    puts
    puts "0 - #{robot1.name} a #{robot1.life_points} points de vie"
    puts "1 - #{robot2.name} a #{robot2.life_points}  points de vie"
    puts
    print ">"
    choice = gets.chomp
    
    case choice
    when 'a'
        user.search_weapon
    when 's'
        user.search_health_pack
    when '0'
        puts "Tu t'apprêtes à taper sur cette pauvre carcasse qu'es #{robot1.name}, qui est deja six pieds sous terre" if robot1.life_points.zero?
        user.attacks(robot1) if robot1.life_points.positive?
    when '1'
        puts "Tu t'apprêtes à taper sur cette pauvre carcasse qu'es #{robot2.name}, qui est deja si pieds sous terre" if robot2.life_points.zero?
        user.attacks(robot2) if robot2.life_points.positive?
    else
        puts " Bizarre tu ne sais pas lire ? ou tu essaie de trouver un code de triche! Pas de bol on est pas sur GTA San Andreas, tu n'aura pas de jetpack"
    end

    puts 
    puts "-" * 57
    puts "Au tour des adversaires d'essayer de te faire mordre la poussière héro de pacotille" if robot1.life_points.positive? || robot2.life_points.positive?
     all_robots.each { |robot| robot.attacks(user) if robot.life_points.positive?}
end
   

puts " FIN DE PARTIE"
puts
if user.life_points.positive?
    puts "CHAMPION TU AS GAGNE"
else
    puts "HALL OF SHAMES, nous avons notre plus gros looser"
end
