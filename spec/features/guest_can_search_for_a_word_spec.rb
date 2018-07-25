require 'rails_helper'

describe 'as a guest user on the home page' do
  it 'can validate a word' do
    query = 'mindfulness'

    visit "/"

    fill_in 'search', with: query

    VCR.use_cassette('features/user_can_search_for_word')do
      click_on "Submit"

      expect(page).to have_content("Examples for using '#{query}'")

      expect(page).to have_css(".sentence")
    end
  end
end
