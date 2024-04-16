class Game

    attr_accessor :human_player, :enemies_in_sight, :players_left
     
     
     def initialize(human_player)
        @enemies_in_sight = Array.new()
        @enemies_in_sight.push(Player.new("joueur_#{rand(0...999)}"), Player.new("joueur_#{rand(0...999)}"), Player.new("joueur_#{rand(0...999)}"), Player.new("joueur_#{rand(0...999)}"),Player.new("joueur_#{rand(0...999)}"))
        puts
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        puts 
        @human_player = HumanPlayer.new(human_player)
        @players_left = 10
      end
    
      def kill_player(player)
        @enemies_in_sight.each do |enemy| 
          if enemy.life_points <= 0
            @enemies_in_sight.delete(enemy)
            @players_left -= 1
            puts "un ennemi de moins ! "
          end
        end
      end
    
      def is_still_ongoing?
         if @human_player.life_points.positive? && @players_left.positive?
          return true
         else
          return false
         end
      end

      def show_players
        puts "     Récap :     "
        puts @human_player.show_state_v2
        puts "il reste #{@players_left} ennemis en vie !"
        puts
      end 
      def new_players_in_sight
        if @enemies_in_sight.size == @players_left
          puts " " * 27 + "Tous les joueurs sont en vie"
          puts
        else
          dice_roller = rand(1..6)
          case dice_roller 
            when 1
              puts " " * 22 + "aucun ennemi n'a été rajouté"
              puts
            when 2..4
              @enemies_in_sight << (Player.new("joueur_ #{rand(1000...9999)}"))
              sleep 0.5
              puts "Attention un ennemi en plus est dans la place !"
              puts
            when 5 || 6
              @enemies_in_sight << Player.new( "joueur_ #{rand(1000...9999)}")
              @enemies_in_sight << Player.new("joueur_ #{rand(1000..9999)}")
              sleep 0.5
              puts "Deux ennemis viennent d'arriver !! A couvert "
              puts
          end
        end
      end

      def menu
        puts "Quelle action veux-tu effectuer ?"
        puts
        puts "a - chercher une meilleure arme"
        puts "s - chercher un pack de soin"
        puts
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        puts
        puts "attaquer un joueur en vue: \n\n"
        num = 0
        @enemies_in_sight.each do |enemy|
          if enemy.life_points.positive?
            print "#{num} - "
            enemy.show_state
            num += 1
          puts
          end
        end
      end

      def enemies_attack 
        @enemies_in_sight.each do |enemy|
          enemy.attacks(@human_player)
          if enemy.life_points <= 0
            kill_player(enemy)
            break
          end  
          puts
        end
      end

      def menu_choice(str)
        case str.downcase
        when 'a'
          @human_player.search_weapon
        when 's'
          @human_player.search_health_pack
        when '0'..@enemies_in_sight.size.to_s
          index = str.to_i
          @human_player.attacks(@enemies_in_sight[index]) if @enemies_in_sight[index].life_points.positive?
          kill_player(@enemies_in_sight[index]) if @enemies_in_sight[index].life_points.zero?
        when 'l1l2r1r2hbgdl1l2r1r2hbgd'
            @human_player.give_god_mode
            puts "Ok bien joué t'es quasiment invincible maintenant le monde t'appartient"
        else
          puts 'Tu cherche encore un code de triche ? Ok peut etre il y en a un (indice: je l ai donné plus tot)'
        end
        enemies_attack
    end

      def fin
        if @human_player.life_points.positive?
          puts 'Bien joué t as win'
        else
          puts 'looser, recommence'
        end
      end

      
end