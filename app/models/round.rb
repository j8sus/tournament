class Round < ApplicationRecord
  ROUND_TYPES = ['group_a', 'group_b', '1/8', '1/4', '1/2']

  belongs_to :tournament
  has_many :games

  validates :game_type, inclusion: { in: ROUND_TYPES }
end
