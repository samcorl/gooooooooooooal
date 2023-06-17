class Keeper
  attr_accessor :match_day_team_names

  def initialize
    @match_day_team_names = []
  end

  def line_in(scoreboard, line_string)
    line = InputLine.new(line_string)
    #puts line.inspect
    line.add_to_scoreboard(scoreboard, self)
  end

  def reset_team_names
    @match_day_team_names = []
  end

  def add_team_name(team_name)
    @match_day_team_names << team_name
  end
end