require_relative "../src/game"
require_relative "../src/results"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_process_game_where_player_x_win_by_horizontal_line
    lines = ['XXXT','....','OO..','....']
    game = Game.new lines
    assert_equal Results::PLAYER_X_WON, game.result
  end

  def test_process_drawn_game
    lines = ['XOXT','XXOO', 'OXOX','XXOO']
    game = Game.new lines
    assert_equal Results::GAME_DRAWN, game.result
  end

  def test_process_uncompleted_game
    lines = ['XOX.','OX..', '....','....']
    game = Game.new lines
    assert_equal Results::UNCOMPLETED, game.result
  end

  def test_process_game_where_player_o_win_by_vertical_line
    lines = ['OOXX','OXXX', 'OX.T','O..O']
    game = Game.new lines
    assert_equal Results::PLAYER_O_WON, game.result
  end

end