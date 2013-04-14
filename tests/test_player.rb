require_relative "../src/player"
require "test/unit"

class TestPlayer < Test::Unit::TestCase

  def setup
    @player = Player.new
  end

  def test_player_should_be_winner_by_horizontal_line
    add_move(0,0)
    add_move(0,1)
    add_move(0,2)
    add_move(0,3)
    add_move(1,2)
    add_move(2,1)
    add_move(2,2)
    
    assert_equal true, @player.is_winner?
  end

  def test_player_should_be_winner_by_vertical_line
    add_move(0,1)
    add_move(0,2)
    add_move(0,3)
    add_move(1,2)
    add_move(2,1)
    add_move(2,2)
    add_move(3,2)

    assert_equal true, @player.is_winner?
  end

  def test_player_should_be_winner_by_diagonal_1
    add_move(0,0)
    add_move(0,1)
    add_move(1,1)
    add_move(2,1)
    add_move(2,2)
    add_move(3,2)
    add_move(3,3)    

    assert_equal true, @player.is_winner?
  end

  def test_player_should_be_winner_by_diagonal_2
    add_move(0,3)
    add_move(0,1)
    add_move(1,2)
    add_move(2,1)
    add_move(2,2)
    add_move(3,0)
    add_move(3,3)    

    assert_equal true, @player.is_winner?
  end

  def add_move(x, y)
    @player.add_move Move.new(x, y)
  end

end