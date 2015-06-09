require 'spec_helper'

describe 'ThreadsAdapter' do
  it 'should run grab images thought threads' do
    Imggrabber::Utils.make_path('./tmp', 'www.w3.org')
    parser = Imggrabber::HtmlParser.new('http://www.w3.org')
    VCR.use_cassette("w3") do
      Imggrabber::Adapters::ThreadsAdapter.run(10, './tmp/www.w3.org', parser.images)
    end
    expect(Dir.entries('./tmp/www.w3.org').length).to eq 19
  end
end