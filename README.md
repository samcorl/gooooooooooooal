# gooooooooooooal!
`score_keeper.rb` reads a listing of game
results for a soccer league as a stream and returns the top teams at
the end of each matchday.

Match days end when a 

## Usage

score_keeper.rb [FILE]

It takes a file name as an optional argument.
If no argument is provided when executing the script, it will read from STDIN.

### Examples

##### From a File

`score_keeper.rb sample-input.txt`

##### From an existing logfile
`tail -f scores.log | score_keeper.rb`

##### listening on STDIN
`score_keeper.rb`

### Input Format

The input should be valid UTF-8 text in the following format:
`TEAM SCORE, TEAM SCORE\n` where "TEAM" is a team name
and "SCORE" is the score for that team in the match.

The input contains results of games, one per line and grouped by matchday. 
All teams play exactly once during a matchday, for example given a 
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

### Match Days

Scores are tallied and reported when the application determines 
a match day has ended. 
Interrupting the input or repeating a team name indicate 
the closing of a match day.

### Score Calculation

Input is read one line at a time. Team names are stored
as they are discovered and scores calculated as a running total.

##### Point Values

A draw (tie) is worth 1 point and a win is worth 3 points. A
loss is worth 0 points. If two or more teams among the top three teams have
the same number of points, they will have the same rank and be printed in
alphabetical order. That said, at most three teams should be listed in the
output per match day.




