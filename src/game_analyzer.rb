require_relative 'game'

class GameAnalyzer

  attr_reader :results

  def initialize(file)
    @file = file.to_a
    @total_games = @file[0].to_i
    @processed_games = 0
    @processed_lines = 1
    @file_limit = @file.size

    start_analyze
  end

  private

    def start_analyze
      @results = []

      while @processed_lines < @file_limit && 
            @processed_games < @total_games

        line1 = @file[@processed_lines]
        line2 = @file[@processed_lines + 1]
        line3 = @file[@processed_lines + 2]
        line4 = @file[@processed_lines + 3]

        @processed_games += 1
        @processed_lines += 5

        result = Game.new([line1, line2, line3, line4]).result
        @results << "Case ##{@processed_games}: #{result}"
      end
    end

end