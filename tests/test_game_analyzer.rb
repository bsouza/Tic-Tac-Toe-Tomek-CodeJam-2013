require_relative "../src/game_analyzer"
require "test/unit"

class TestGameAnalyzer < Test::Unit::TestCase

  def setup
    @file = File.open('./input_teste')
  end
 
  def teardown
    @file.close
  end

  def test_process_input_file    
    game = GameAnalyzer.new @file
    assert_equal 6, game.results.size
    assert_equal "Case #1: X won", game.results[0]
    assert_equal "Case #2: Draw",  game.results[1]
    assert_equal "Case #3: Game has not completed", game.results[2]
    assert_equal "Case #4: O won", game.results[3]
    assert_equal "Case #5: O won", game.results[4]
    assert_equal "Case #6: O won", game.results[5]
  end

end