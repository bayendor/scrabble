class Scrabble
  LETTER_VALUES = {
    'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
    'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
    'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
    'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
    'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
    'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
    'Y' => 4, 'Z' => 10
  }

  def self.score(word)
    letters = word.to_s.upcase.strip.chars
    return 0 if letters.empty?
    letters.reduce(0) { |sum, letter| sum + LETTER_VALUES[letter] }
  end

  def self.highest_score_from(words)
    high_scores = words.group_by { |word| score(word) }.max
    high_scores[1].min_by(&:length) # instead of { |word| word.length }
  end
end
