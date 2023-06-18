#!/usr/bin/env ruby
require('benchmark')
file_path = "spec/sample_data/large-file.txt"
num_lines = `wc -l #{file_path}`.strip.split(' ').first

puts "\n\nPerformance Testing"
puts "-------------------"
puts "Testing file: #{file_path}\n"
puts "#{num_lines} data lines\n"
puts "  user       system    sum         elapsed real time"
puts Benchmark.measure {
  `ruby run.rb #{file_path}`
}
