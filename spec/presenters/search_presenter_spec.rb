require 'rails_helper'

describe SearchPresenter do
  describe "instance methods" do
    it "presents proper attributes" do
      example = 'test'
      VCR.use_cassette('presenters/search_presenter') do
        data = SearchPresenter.new(example)

        expect(data.word).to eq(example)
        expect(data.filtered_sentences.class).to eq(Array)
        expect(data.filtered_sentences.first.include?(example)).to eq(true)
        expect(data.filtered_sentences.last.include?(example)).to eq(true)
      end
    end
  end
end
