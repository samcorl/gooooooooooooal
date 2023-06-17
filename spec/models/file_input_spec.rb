RSpec.describe FileInput do

  subject = FileInput

  # This spec runs the app, which is noisy to STDOUT so let's redirect that output from the console
  before do
    @original_stdout = $stdout
    outfile = File.open('/dev/null', 'w')
    $stdout = outfile
  end

  after do
    $stdout = @original_stdout
  end

  describe "#read" do
    context "file exists and is readable" do
      let(:file_path) { 'spec/sample_data/sample-input.txt' }
      it "does not raise an error" do
        expect { subject.new(file_path).read }.not_to raise_error
      end
    end

    context "file is not found" do
      let(:invalid_file_path) { 'INVALID_FILE_PATH' }
      it "raises an exception" do
        expect { subject.new(invalid_file_path).read }.to raise_error Errno::ENOENT
      end
    end

    context "file has four days of matches" do
      let(:file_path) { 'spec/sample_data/sample-input.txt' }
      it "curent page number is 4" do
        file_input_instance = subject.new(file_path)
        file_input_instance.read
        expect(file_input_instance.scoreboard.day_number).to eq 5
      end
    end
  end
end
