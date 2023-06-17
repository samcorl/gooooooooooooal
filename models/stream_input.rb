class StreamInput
  attr_accessor :scoreboard, :keeper, :stream

  def initialize(stream)
    @stream = stream
    @scoreboard = ScoreBoard.new
    @keeper = Keeper.new
  end

  def read
    begin
        while gets
          @keeper.line_in(scoreboard, file)
        end
    rescue EOFError
      # end of file reached, reporting scores
      scoreboard.render
    end
    self
  end
end
