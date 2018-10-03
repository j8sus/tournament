class Round < ApplicationRecord
  ROUND_TYPES = ['group_a', 'group_b', 'play_off_1_4', 'play_off_1_2', 'play_off_final']

  belongs_to :tournament
  has_many :games, dependent: :destroy

  validates :round_type, inclusion: { in: ROUND_TYPES }

  def teams_ids
    games.pluck(:team_a, :team_b).flatten.uniq
  end
end
