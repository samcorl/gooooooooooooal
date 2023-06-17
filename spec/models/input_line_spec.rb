RSpec.describe InputLine do

  describe "#parse" do
    context "input line is valid with two teams and two scores" do
      let(:line) { 'San Jose Earthquakes 3, Santa Cruz Slugs 3' }
      it "returns two match scores with correct values" do
        match_scores = InputLine.new(line).parse_line
        expect(match_scores.size).to eq 2
        expect(match_scores[0].team_name).to eq "San Jose Earthquakes"
        expect(match_scores[0].score).to eq "3"
        expect(match_scores[1].team_name).to eq "Santa Cruz Slugs"
        expect(match_scores[1].score).to eq "3"
      end
    end

    context "input line is just a line break" do
      let(:line) { "\n" }
      it "returns an empty set of match scores" do
        match_scores = InputLine.new(line).parse_line
        expect(match_scores.size).to eq 0
      end
    end

    context "input line is blank" do
      let(:line) { "" }
      it "returns an empty set of match scores" do
        match_scores = InputLine.new(line).parse_line
        expect(match_scores.size).to eq 0
      end
    end

    context "input line is invalid" do
      let(:line) { "Time flies like an arrow. Fruit flies like a banana." }
      it "returns an empty set of match scores" do
        match_scores = InputLine.new(line).parse_line
        expect(match_scores.size).to eq 0
      end
    end
    context "input line might be dangerous" do
      let(:line) { "`cat /etc/passwd`" }
      it "returns an empty set of match scores, nullifying the threat" do
        match_scores = InputLine.new(line).parse_line
        expect(match_scores.size).to eq 0
      end
    end
  end
end
