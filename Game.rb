require './player'

class Game 
  attr_reader :start
  attr_accessor :current_player

  def start_game
    @p1 = Player.new('Player_1', 3)
    @p2 = Player.new('Player_2', 3)
    @current_player = @p1
    while (game_on) 
      question(@current_player)
    end
  end

  def game_on 
    if @p1.lives === 0
      puts "#{@p2.name} wins with a score of #{@p2.lives}/3"
      false
    elsif @p2.lives === 0
      puts "#{@p1.name} wins with a score of #{@p1.lives}/3"
      false
    else
      true
    end
  end

  def change_current_player
    @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
  end

  def question(current_player)
    @num_1 = Integer(rand(1..20))
    @num_2 = Integer(rand(1..20))
    answer = @num_1 + @num_2

    puts "-----NEW TURN-----"
    puts "#{@current_player.name} what is #{@num_1} plus #{@num_2}?"
    @player_answer = gets.chomp.to_i
    
    if @player_answer == answer 
      puts "#{@current_player.name} YES! You are correct."
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    else
      puts "#{@current_player.name} Seriously? No!"
      @current_player.lives -= 1
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    end

    self.change_current_player

  end

end