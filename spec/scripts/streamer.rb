#!/usr/bin/env ruby

# This is for testing the streaming input. It sends a stream of team names and scores.
TEAM_NAMES = [
  'San Jose Earthquakes',
  'Los Angeles FCLAFC',
  'LA Galaxy',
  'Portland Timbers',
  'Real Salt Lake Claret & Cobalt',
  'Seattle Sounders FC',
  'Vancouver Whitecaps FC',
  'Colorado Rapids',
  'FC Dallas Toros',
  'Kansas City Sporting',
  'Austin FC Verde',
  'Minnesota United Loons',
  'Houston Dynamo',
  'St. Louis CITY SC',
  'Chicago Fire FC',
  'Nashville Soccer Club',
  'FC Cincinnati Orange & Blue',
  'Columbus Crew SC',
  'Atlanta United FC Five Stripes',
  'Toronto FC Reds',
  'Charlotte FC Queen City',
  'D.C. United Black & Red',
  'Orlando City SC Lions',
  'Philadelphia Union',
  'Club de Foot Montréal CFM',
  'New York Red Bulls',
  'New York City FC Cityzens',
  'Inter Miami CF Cranes',
  'New England Revolution',
].freeze

sleep_delay = ARGV[0] || 1
limit = ARGV[1] || 1000
counter = 1
time_start = Time.new

$stdout.sync = true

while counter < limit.to_i
  team1 = TEAM_NAMES[rand(TEAM_NAMES.size)]
  string = "#{team1} #{rand(10)}, "
  team2 = TEAM_NAMES[rand(TEAM_NAMES.size)]
  while (team1 == team2)
    team2 = TEAM_NAMES[rand(TEAM_NAMES.size)]
  end
  string << "#{team2} #{rand(10)}\n"
  puts string
  counter += 1
  sleep sleep_delay.to_f
end

time_end = Time.new
duration = time_end - time_start
puts "Duration: #{duration}"

