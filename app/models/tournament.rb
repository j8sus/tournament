class Tournament < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :rounds, dependent: :destroy

  validate :validate_teams

  def validate_teams
    errors.add(:team_ids, 'Select 16 teams') if teams.size != 16
  end
end
