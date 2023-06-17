RSpec.describe Keeper do

  describe "#line_in" do
    let(:scoreboard) { ScoreBoard.new }

    subject { Keeper.new }

    context "#line_in" do
      let(:file_path) { 'spec/sample_data/sample-input.txt' }
      let(:file_handle) { File.open(file_path) }

      it "correctly adds to the scoreboard" do
        # reading in the first line should create two teams
        subject.line_in(scoreboard, file_handle.readline)
        expect(scoreboard.teams.size).to eq 2

        # same with the next line, as we haven't repeated teams in the data yet
        subject.line_in(scoreboard, file_handle.readline)
        expect(scoreboard.teams.size).to eq 4
      end
    end

    context "#add_team_name" do
      let(:team) { Team.new('Jane Technologies All-Stars') }
      it "adds the name passed as argument" do
        subject.add_team_name team.name
        expect(subject.match_day_team_names).to eq ['Jane Technologies All-Stars']
      end
    end

  end
end
