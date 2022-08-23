require './parser'

describe Parser do
  let(:parser) { described_class.new([filename]).call }

  let(:filename) { 'webserver.log' }
  let(:expected_output) do
    <<~OUTPUT
    VISITS BY URL
    /about/2 90 visits
    /contact 89 visits
    /index 82 visits
    /about 81 visits
    /help_page/1 80 visits
    /home 78 visits

    UNIQ VISITS BY URL
    /help_page/1 23 visits
    /contact 23 visits
    /home 23 visits
    /index 23 visits
    /about/2 22 visits
    /about 21 visits

    OUTPUT
  end

  it 'returns formatted report' do
    expect { parser }.to output(expected_output).to_stdout
  end

  describe 'if filename' do
    context 'is missing' do
      let(:filename) { nil }

      it 'prints corresponding error' do
        expect do
          expect { parser }.to output('Parser: Filename missing!').to_stdout
        end.to raise_error(SystemExit)
      end
    end

    context 'is invalid' do
      let(:filename) { 'existing_filename.log' }

      it 'prints corresponding error' do
        expect do
          expect { parser }.to output('Parser: File does not exist!').to_stdout
        end.to raise_error(SystemExit)
      end
    end
  end
end
