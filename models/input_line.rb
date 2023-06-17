class InputLine
  attr_accessor :line, :match_scores

  def initialize(line)
    @line = line
    @match_scores = []
  end

  def parse_line
    #puts "Parsing: #{line}"
    return [] if line.chomp.size == 0
    segments = line.chomp.split(', ')
    return [] if segments.size != 2
    segments.each do |segment|
      segment_array = segment.split(' ')
      score = segment_array.pop
      team_name = segment_array.join(' ')
      @match_scores << MatchScore.new(team_name, score)
    end
    @match_scores
  end

  def add_to_scoreboard(scoreboard, keeper)
    # In each match, there are two teams, each with a score.
    # This couplet is referred to below as a "match_score"
    match_scores = parse_line
    return if match_scores.empty?
    match_scores.each do |match_score|
      #puts "Team name: #{match_score.team_name}"
      #puts "Team names: #{keeper.match_day_team_names}"
      if keeper.match_day_team_names.include? match_score.team_name
        #puts "NEW DAY!"
        # The repeat of a team name means it's a NEW DAY :-)
        scoreboard.render
        keeper.reset_team_names
      else
        keeper.add_team_name match_score.team_name
      end
    end

    #puts "Match Scores"
    #puts match_scores.inspect
    if match_scores[0].score == match_scores[1].score
      #puts "TIE"
      # tie
      scoreboard.add_points(match_scores[0].team_name, 1)
      scoreboard.add_points(match_scores[1].team_name, 1)
    else
      winner = match_scores.sort{|a,b| a.score <=> b.score}[1]
      #puts "WINNER: #{winner.inspect}"
      scoreboard.add_points(match_scores.sort{|a,b| a.score <=> b.score}[1].team_name, 3)
      scoreboard.add_points(match_scores.sort{|a,b| a.score <=> b.score}[0].team_name, 0)
    end
  end
end