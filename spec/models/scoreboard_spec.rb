RSpec.describe ScoreBoard do

  context "file has four days of matches" do
    let(:file_path) { 'spec/sample_data/sample-input.txt' }
    let(:expected_output_path) { 'spec/sample_data/expected-output.txt' }
    let(:output_path) { 'spec/tmp/sample-output.txt' }

    before do
      @original_stdout = $stdout
      outfile = File.open(output_path, 'w')
      $stdout = outfile
      @file_input = FileInput.new(file_path)
      @file_input.read
      outfile.close
      $stdout = @original_stdout
    end

    it "reports the correct values to STDOUT" do
      expect(@file_input.scoreboard.day_number).to eq 5
      expected_output = File.read(expected_output_path)
      actual_output = File.read(output_path)
      expect(actual_output).to eq expected_output
    end
  end
end
