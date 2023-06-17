class MatchScore
  attr_accessor :team_name, :score

  def initialize(team_name, score)
    @team_name = team_name
    @score = score
  end
end