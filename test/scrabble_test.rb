gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.score('a')
    assert_equal 4, Scrabble.score('f')
  end

  def test_it_scores_nil_or_empty_word_as_0
    assert_equal 0, Scrabble.score('')
    assert_equal 0, Scrabble.score(nil)
    assert_equal 0, Scrabble.score(' ')
  end

  def test_it_scores_a_multi_letter_word
    assert_equal 4, Scrabble.score('be')
    assert_equal 8, Scrabble.score('hello')
  end

  def test_it_is_case_insensitive
    assert_equal 4, Scrabble.score('BE')
    assert_equal 8, Scrabble.score('Hello')
  end

  def test_highest_score_from_a_list_of_words
    assert_equal 'home', Scrabble.highest_score_from(%w(home word hello sound))
  end

  def test_shortest_word_with_equal_score_wins
    assert_equal 'word', Scrabble.highest_score_from(%w(hello word sound))
  end

  def test_seven_letter_word_wins
    assert_equal 'silence', Scrabble.highest_score_from(%w(home word silence))
  end

  def test_first_of_multiple_words_with_same_score_and_length_wins
    assert 'word', Scrabble.highest_score_from(%w(hi word ward))
    assert 'ward', Scrabble.highest_score_from(%w(hi ward word))
  end
end
