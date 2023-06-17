class FileInput
  attr_accessor :file_path, :scoreboard, :keeper

  def initialize(file_path)
    @file_path = file_path
    @stream = nil
    @scoreboard = ScoreBoard.new
    @keeper = Keeper.new
  end

  def read
    begin
      File.open(@file_path) do |file|
        while line = file.readline
          @keeper.line_in(scoreboard, line)
        end
      end
    rescue EOFError
      # end of file reached, reporting scores
      scoreboard.render
    end
    self
  end
end
