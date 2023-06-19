class StreamInput
  attr_accessor :scoreboard, :keeper

  def initialize
    @scoreboard = ScoreBoard.new
    @keeper = Keeper.new
  end

  def read
    begin
      while line = gets
        @keeper.line_in(scoreboard, line)
      end
    rescue Interrupt
      puts "Interrupt caught. Please close the stream rather than sending kill signal."
    ensure
      # end of stream reached, or it was interrupted
      scoreboard.render
    end
    self
  end
end
