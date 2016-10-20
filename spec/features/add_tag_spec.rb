require 'spec_helper'

feature 'adding a new tag' do
  scenario 'add a single tag to a new link' do

    visit "/links/new"

    fill_in "new_url", :with => "http://www.github.com"
    fill_in "new_title", :with => 'Github'
    fill_in "new_tag", :with => 'social media'
    click_button "Submit"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('social media')
    end
  end
end
