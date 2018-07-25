require 'rails_helper'

  describe 'Word Search Service' do
    it 'returns the word you queried' do
      VCR.use_cassette('services/word_search_service') do
        response = WordSearchService.new("test").search
        expect(response.class).to eq(Array)
        expect(response.first.class).to eq(String)
        expect(response.last.class).to eq(String)
      end
    end
  end
