gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
# require 'minitest/pride'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.score("a")
    assert_equal 4, Scrabble.score("f")
  end

  def test_it_can_score_word
    assert_equal 8, Scrabble.score("hello")
    assert_equal 4, Scrabble.score("be")
  end

  def test_it_can_score_an_uppercase_word
    assert_equal 8, Scrabble.score("HELLO")
    assert_equal 4, Scrabble.score("BE")
  end

  def test_it_returns_zero_for_empty_or_nil_words
    assert_equal 0, Scrabble.score("")
    assert_equal 0, Scrabble.score(nil)
    assert_equal 0, Scrabble.score(' ')
  end

  def test_returns_the_highest_score_from_a_list_of_words
    assert_equal 'home', Scrabble.highest_score_from(['word', 'home', 'hello', 'sound'])
  end

  def test_the_shortest_word_wins
    assert_equal 'word', Scrabble.highest_score_from(['hello', 'word', 'sound'])
  end
end
