require 'spec_helper'

feature 'submit a new link' do
  scenario 'fill out form and submit link' do

    visit "/links/new"

    fill_in "new_url", :with => "http://www.github.com"
    fill_in "new_title", :with => 'Github'
    click_button "Submit"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Github')
    end
  end
end
