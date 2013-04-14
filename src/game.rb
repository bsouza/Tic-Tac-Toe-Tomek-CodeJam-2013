require_relative 'results'
require_relative 'player'

class Game

  attr_reader :result, :player_x, :player_o, :null_moves

  def initialize(lines)    
    @player_x = Player.new
    @player_o = Player.new
    @null_moves = 0

    processed_lines = 0

    while processed_lines < 4
      char = 0
      while char < 4
        move = lines[processed_lines][char]
        case move
          when 'X' then 
            move_player_x processed_lines, char
          when 'O' then 
            move_player_o processed_lines, char
          when 'T' then 
            move_player_x processed_lines, char
            move_player_o processed_lines, char
          else
            @null_moves += 1
        end
        char += 1
      end
      processed_lines += 1
    end

    if @player_x.is_winner?
      @result = Results::PLAYER_X_WON
    elsif @player_o.is_winner?
      @result = Results::PLAYER_O_WON
    elsif @null_moves > 0
      @result = Results::UNCOMPLETED
    else
      @result = Results::GAME_DRAWN
    end
  end

  private

    def move_player_x(x, y)
      move(@player_x, x, y)
    end

    def move_player_o(x, y)
      move(@player_o, x, y)
    end

    def move(player, x, y)
      player.add_move(Move.new(x, y))
    end

end