#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/models'
require 'file_input.rb'
require 'input_line.rb'
require 'keeper.rb'
require 'match_score.rb'
require 'scoreboard.rb'
require 'stream_input.rb'
require 'team.rb'

$stdout.sync = true

if file_path = ARGV.first
  FileInput.new(file_path).read
else
  StreamInput.new().read
end
