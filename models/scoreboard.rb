class ScoreBoard
  attr_accessor :teams, :day_number

  def initialize
    @teams = []
    @day_number = 1
  end

  def render
    sorted = teams.sort do |a, b|
      a.sortval <=> b.sortval
    end

    puts "\n" if @day_number > 1
    puts "Matchday #{day_number}"
    sorted.slice(0,3).each do |team|
      puts "#{team.name}, #{team.points} #{team.points > 1 ? 'pts' : 'pt'}"
    end
    @day_number += 1
  end

  def add_points(team_name, points)
    #puts "Adding team / points #{team_name} / #{points}"
    team = teams.select{|team| team.name == team_name }.first
    if team.nil?
      #puts "Team not found - creating a new team"
      team = Team.new(team_name)
      teams << team
    end
    team.points += points.to_i
  end

end