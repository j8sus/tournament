class RoundsController < ApplicationController
  before_action :set_tournament, only: [:create, :generate_result]

  def generate_result
    if params[:round_type] != 'play_off'
      @round            = @tournament.rounds.create(round_type: params[:round_type])
      group_a_teams_ids = @tournament.rounds.find_by(round_type: 'group_a').teams_ids if params[:round_type] == 'group_b'

      teams = @tournament.teams.where.not(id: group_a_teams_ids).sample(8)

      8.times do
        team_a = teams.shift
        teams.each do |team_b|
          score_a = ScoreGenerator.random_score
          score_b = ScoreGenerator.random_score
          score_b = score_b != score_a ? score_b : score_b + 1

          @round.games.create(
          team_a: team_a.id,
          team_b: team_b.id,
          score:  "#{score_a}/#{score_b}",
          winner: (score_a > score_b ? team_a.id : team_b.id)
          )
        end
      end
    else
      teams_with_rating = {}

      @rounds = @tournament.rounds
      @rounds.each do |round|
        teams = Team.where(id: round.teams_ids)

        teams.each do |team|
          teams_with_rating[team.id] = round.games.where(winner: team.id).count
        end
      end

      generate_play_off(teams_with_rating)
      generate_play_off_1_2
      generate_play_off_final
    end

    redirect_to tournament_path(@tournament)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def team_params
    params.require(:team).permit(:title)
  end

  def generate_play_off(teams_with_rating)
    sorted_teams = teams_with_rating.sort_by { |team_id, wins| wins }.reverse[0..7]
    sorted_teams.map! { |team_score| team_score.first }

    @round = @tournament.rounds.create(round_type: 'play_off_1_4')

    4.times do |i|
      score_a = ScoreGenerator.random_score
      score_b = ScoreGenerator.random_score
      score_b = score_b != score_a ? score_b : score_b + 1

      team_a_id = sorted_teams.pop
      team_b_id = sorted_teams.shift

      @round.games.create(
      team_a: team_a_id,
      team_b: team_b_id,
      score:  "#{score_a}/#{score_b}",
      winner: (score_a > score_b ? team_a_id : team_b_id)
      )
    end
  end

  def generate_play_off_1_2
    play_off         = @tournament.rounds.find_by(round_type: 'play_off_1_4')
    play_off_winners = play_off.games.pluck(:winner)

    @round = @tournament.rounds.create(round_type: 'play_off_1_2')

    couples = play_off_winners.each_slice(2).to_a

    couples.each do |couple|
      score_a = ScoreGenerator.random_score
      score_b = ScoreGenerator.random_score
      score_b = score_b != score_a ? score_b : score_b + 1

      team_a_id = couple.first
      team_b_id = couple.last

      @round.games.create(
        team_a: team_a_id,
        team_b: team_b_id,
        score:  "#{score_a}/#{score_b}",
        winner: (score_a > score_b ? team_a_id : team_b_id)
      )
    end
  end

  def generate_play_off_final
    round         = @tournament.rounds.find_by(round_type: 'play_off_1_2')
    round_winners = round.games.pluck(:winner)

    @round = @tournament.rounds.create(round_type: 'play_off_final')

    couples = round_winners.each_slice(2).to_a

    couples.each do |couple|
      score_a = ScoreGenerator.random_score
      score_b = ScoreGenerator.random_score
      score_b = score_b != score_a ? score_b : score_b + 1

      team_a_id = couple.first
      team_b_id = couple.last

      @round.games.create(
        team_a: team_a_id,
        team_b: team_b_id,
        score:  "#{score_a}/#{score_b}",
        winner: (score_a > score_b ? team_a_id : team_b_id)
      )
    end
  end
end
