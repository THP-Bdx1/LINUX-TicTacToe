require 'pry'

class BoardCase
    attr_accessor :contains
    def initialize(name)
        @contains = name
    end

    def give_to_player1
        @player1.pusher(@contains)
        @contains = 'X'
    end

    def give_to_player2
        @player2.pusher(@contains)
        @contains = 'O'
    end
end
  

class Board
    def initialize
        @A1 = BoardCase.new("A1")
        @A2 = BoardCase.new("A2")
        @A3 = BoardCase.new("A3")
        @B1 = BoardCase.new("B1")
        @B2 = BoardCase.new("B2")
        @B3 = BoardCase.new("B3")
        @C1 = BoardCase.new("C1")
        @C2 = BoardCase.new("C2")
        @C3 = BoardCase.new("C3")
        @case_array = [@A1, @A2, @A3, @B1, @B2, @B2, @C1, @C2, @C3]
    end
    def printer
        system("clear")
        puts @A1.contains + "|" + @A2.contains + "|" + @A3.contains
        puts "---------------------------------"
        puts @B1.contains + "|" + @B2.contains + "|" + @B3.contains
        puts "---------------------------------"
        puts @C1.contains + "|" + @C2.contains + "|" + @C3.contains
    end
end
  

class Player
    attr_accessor :name, :array_player
    def initialize(name)
        @name = name
        @array_player = []
    end        

    def show_name
        return @name
    end

    def pusher(contains)
        @array_player.push(contains)
    end
end
  

class Game
    def initialize
        @@turn_counter=0
        x = gets.chomp
        @@player1 = Player.new(x)
        x = gets.chomp
        @@player2 = Player.new(x)
        @board = Board.new
        9.times do
            Game.play_a_turn
            @board.printer
            Game.check_victory
        end
    end


    def Game.play_a_turn
        if @@turn_counter.even? == true
            puts "C'est a #{@@player1.show_name} de jouer"
            x = gets.chomp
            @@case_array.each do k
                if k.to_s =~ x
                    x=k
                end
            end
            x.give_to_player1
        elsif @@turn_counter.even? == false
            puts "C'est a #{@@player2.show_name} de jouer"
            x = gets.chomp
            x.give_to_player2
        end
        @@turn_counter += 1
    end

    def Game.check_victory
        arr.each do k # arr contient ABC123
            @array_player.each do l
                if l=~k
                    c=c+1
                end
            end
            if c == 3 
                return "VICTOIRE CA MERE"
            end
        end
    end
end
  
Game.new
=begin
Game.new.go
# DEBUT DU PLAYAGAIN
loop do

    #TOUT LE RESTE

    puts "Play Again ? [O/N]"
    yes_no = gets.chomp
    if yes_no == "o" || yes_no == "O"
        puts "Loading..."
        sleep(3)
    elsif yes_no == "n" || yes_no == "N"
        break
    else
        puts "error, game will start back in 5s"
        sleep(5)                
end
# FIN PLAYAGAIN
=end