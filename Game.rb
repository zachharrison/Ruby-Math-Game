require './player'

class Game 
  attr_reader :start

  def start_game
    @p1 = Player.new('Player_1', 3)
    @p2 = Player.new('Player_2', 3)
    @current_player = @p1
    "----THE GAME HAS STARTED----"
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

end