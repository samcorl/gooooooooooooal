# gooooooooooooal!
This application reads a listing of game
results for a soccer league as a stream and emits to STDOUT the top three 
teams at the end of each match day.

## Usage

./run.rb [FILE]

`run.rb` is used to run the application. 
It takes a file path as an optional argument.
If no argument is provided when executing the script, it will read from STDIN.

## Examples

##### From a File

`./run.rb sample-input.txt`

##### listening on STDIN
`./run.rb`

##### Piped from an existing logfile
`tail -f scores.log | ./run.rb`

## Input Format

The input should be valid UTF-8 text in the following format:
`$TEAM $SCORE, $TEAM $SCORE\n` where `$TEAM` is a team name
and `$SCORE` is the score for that team in the match.

The input contains results of games, one per line and grouped by match day. 
All teams play exactly once during a match day. For example, given a 
league of six teams, each match day would consist of three games. 
There is no delimiter required between match days. 

Lines with invalid format and blank lines are ignored.

##### Example
```
San Jose Earthquakes 3, Santa Cruz Slugs 3
Capitola Seahorses 1, Aptos FC 0
Felton Lumberjacks 2, Monterey United 0
Felton Lumberjacks 1, Aptos FC 2
Santa Cruz Slugs 0, Capitola Seahorses 0
Monterey United 4, San Jose Earthquakes 2
Santa Cruz Slugs 2, Aptos FC 3
San Jose Earthquakes 1, Felton Lumberjacks 4
Monterey United 1, Capitola Seahorses 0
Aptos FC 2, Monterey United 0
Capitola Seahorses 5, San Jose Earthquakes 5
Santa Cruz Slugs 1, Felton Lumberjacks 1
```

## Match Days

Scores are tallied and reported when the application determines 
a match day has ended. 
Interrupting the input or repeating a team name indicate 
the closing of a match day.

## Score Calculation

Input is read one line at a time. Team names are stored
as they are discovered and scores calculated as a running total.
All teams start with zero points, there is no ability to "seed" point values.

## Point Values

A draw (tie) is worth 1 point and a win is worth 3 points. A
loss is worth 0 points. If two or more teams among the top three teams have
the same number of points, they will have the same rank and be printed in
alphabetical order. That said, at most three teams should be listed in the
output per match day.

## Testing

`rspec` from project root. I tested with Ruby 3.1.2 on Mac OS.

## Performance Testing

A script is provided to report the CPU time reading in a large file (1M lines).
This is provided so maintainers can test code changes for performance regression.
The reported timings are in seconds.

`./spec/scripts/performance_test.rb`

On a Macbook from 2017 / 2.8 GHz Quad-core Intel i7 CPU, 
the following results are reported:

```
Performance Testing
-------------------
Testing file: spec/sample_data/large-file.txt
1000001 data lines
  user       system    sum         elapsed real time
  1.039146   1.797994  74.730817 ( 72.565576)

```

## Stream From Log Testing

#### In first window
`./spec/scripts/streamer.rb .05 10000 > stream.log`

#### In second window
`tail -f stream.log | ./run.rb`

## Contact

Any questions or concerns, please contact Sam Corl sam@samcorl.com

