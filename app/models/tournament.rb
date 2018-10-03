class Tournament < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :rounds, dependent: :destroy

  validate :validate_teams

  def validate_teams
    errors.add(:team_ids, 'Select 16 teams') if teams.size != 16
  end

  def group_a
    rounds.where(round_type: 'group_a')
  end

  def group_b
    rounds.where(round_type: 'group_b')
  end

  def play_off_1_4
    rounds.where(round_type: 'play_off_1_4')
  end

  def play_off_1_2
    rounds.where(round_type: 'play_off_1_2')
  end

  def play_off_final
    rounds.where(round_type: 'play_off_final')
  end
end
