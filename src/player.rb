require_relative 'move'

class Player

  def initialize
    @moves = []
  end

  def add_move(move)
    @moves << move 
  end

  def is_winner?
    process_moves
    @is_winner
  end

  private 

    def process_moves
      if !@is_winner
        hor      = [0, 0, 0, 0]
        vert     = [0, 0, 0, 0]
        diagonal = [0, 0]
        
        @moves.each do |move|
          hor[move.x] += 1
          vert[move.y] += 1

          if move.x == move.y
            diagonal[0] += 1
          elsif move.x + move.y == 3
            diagonal[1] += 1
          end

          if hor[move.x] == 4 || vert[move.y] == 4 ||
             diagonal[0] == 4 || diagonal[1] == 4
            @is_winner = true
            break
          end
        end

        @is_winner ||= false
      end
      @is_winner
    end

end