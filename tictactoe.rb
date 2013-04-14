require_relative 'src/game_analyzer'

class TicTacToe

  def initialize(filename)
    if filename.nil? || !File.exists?(filename)
      raise "File not found!"
    end
    analyze_game filename
  end

  private 
  
    def analyze_game(filename)
      File.open(filename) do |file_in|
        results = GameAnalyzer.new(file_in).results
        File.open('output', 'w') do |f|
          results.each do |line|
            f.puts line
          end
        end
      end
    end

end