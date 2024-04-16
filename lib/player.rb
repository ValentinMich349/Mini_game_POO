class Player 
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end 

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(points_damage)
        @life_points -= points_damage.to_i 
        if @life_points <= 0 
          puts "le joueur #{@name} a été tué !\n"
          @life_points = 0
        end
    end

    def attacks(target)
        puts "#{@name} attaque #{target.name} !"
        points_of_attack = compute_damage
        puts "#{@name} lui inflige #{points_of_attack} points de dommage(s)\n"
        target.gets_damage(points_of_attack)
    end

    def compute_damage
        return rand(1..6)
    end
end
