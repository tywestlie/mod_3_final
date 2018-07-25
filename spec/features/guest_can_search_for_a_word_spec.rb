require 'rail_helper'

describe 'as a guest user on the home page' do
  it 'can validate a word' do
    query = 'mindfulness'
    visit "/"

    # And I fill in a text box with "mindfulness"
      fill_in 'search', with: query
    # And I click "Submit"
    click_on "Submit"
    # Then I should see a message that says "Examples for using 'mindfulness'"
    expect(page).to have_content("Examples for using '#{query}'")
    # And I should see a list of sentences with examples of how to use the word
    expect(page).to have_css(".sentence")
    # And I should see only sentences for usage in North America
    # And I should not see sentences for any other regions (or blank regions)
  end
end
