require 'spec_helper'

feature 'can sign in' do
  scenario 'click Sign In button' do

    visit "/"
    click_button "Sign In"
    click_button "New Link"

    expect(page).to have_content("URL")
  end
end
