require 'spec_helper'

describe 'ThreadsAdapter' do
  let(:url) { 'http://www.kinopoisk.ru/' }
  let!(:parser) { VCR.use_cassette('kinopoisk') { Imggrabber::HtmlParser.new(url) } }

  it 'should run grab images thought threads' do
    Imggrabber::Utils.make_path('./tmp', 'www.kinopoisk.ru')
    VCR.use_cassette('images') do
      Imggrabber::Adapters::ThreadsAdapter.run(10, './tmp/www.kinopoisk.ru', parser.images)
    end
    expect(Dir.entries('./tmp/www.kinopoisk.ru').length).to eq 2
  end
end