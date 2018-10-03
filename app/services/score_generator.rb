require 'securerandom'

class ScoreGenerator
  def self.random_score
    SecureRandom.random_number(10)
  end
end
