class Tournament < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :rounds, dependent: :destroy

  validate :validate_teams

  def validate_teams
    errors.add(:team_ids, I18n.t('necessary_teams_count', count: 16)) if team_ids.size != 16
  end

  def group_stage
    rounds.where(round_type: 'group')
  end

  def play_off
    rounds.where(round_type: 'play_off')
  end
end
