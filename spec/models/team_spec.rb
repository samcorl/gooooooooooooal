RSpec.describe Team do

  describe "#sortval" do
    let(:team) { Team.new('Jane Technologies All-Stars') }

    before do
      team.points = points
    end

    context "points are a valid positive number" do
      let(:points) { 10 }
      it "returns the correct values" do
        expect(team.sortval).to eq "0990Jane Technologies All-Stars"
      end
    end

    context "points are nil somehow (no idea how)" do
      let(:points) { nil }
      it "returns the correct value as if the points were zero" do
        expect(team.sortval).to eq "1000Jane Technologies All-Stars"
      end
    end
  end
end
