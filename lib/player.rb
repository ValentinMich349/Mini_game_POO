class Player 
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end 

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} points de vie"
        else
            puts "#{@name} n'est plus de ce monde "
        end
    end

    def gets_damage(points_damage)
        @life_points -= points_damage.to_i 
        if @life_points <= 0 
          puts "le joueur #{@name} a été tué !\n"
          @life_points = 0
        end
    end

    def attacks(target)
        points_of_attack = compute_damage
        puts "#{@name} attaque #{target.name}, #{target.name} perds #{points_of_attack} de vie\n"
        target.gets_damage(points_of_attack)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @weapon_level = 1
        @life_points = 100
      end
    

      def compute_damage
        rand(1..6) * weapon_level
      end
    

      def show_state_v2
        puts "#{name} possède #{life_points} points de vie et une arme de niveau #{weapon_level}"
      end

      def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        puts 
        if new_weapon_level > @weapon_level
            puts "Cette nouvelle arme est bien meilleur, equipe la"
            @weapon_level = new_weapon_level
        else
            puts "Dommage cette arme ne vaut pas le coup, elle est toute rouillé"    
        end    
      end  

      def search_health_pack
        health_pack = rand(1..6)
        case health_pack
        when 1
            puts "Tu repars fatigué et sans soin"
            puts
        when 2..5
            @life_points += 50
            puts "Youhou, tu as trouver un pack de soin qui te rend 50 points de vie, c'est pas genial ca ?"
            puts
        when 6
            @life_points += 80
            puts "INCROYABLE, t'as chance n'as donc pas de limite, tu viens de trouver un pack de soin qui te rend 80 points de vie !!!"
            puts
        end

        if @life_points >100
            @life_points = 100
            puts "limite de points de vie atteinte"
            puts
        else
            puts "ton nombre de points de vie est de #{@life_points}"
        end
    end

    def give_god_mode
        @life_points = 10000
        @weapon_level = 20
    end
end