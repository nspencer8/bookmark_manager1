require 'spec_helper'

feature 'submit a new link' do
  scenario 'fill out form and submit link' do

    visit "/"
    click_button "Sign In"
    click_button "New Link"

    fill_in "new_url", :with => "http://www.google.com"
    fill_in "new_title", :with => 'Google'
    click_button "Submit"
    Link.create(url: 'http://www.google.com', title: 'Google')

    expect(page).to have_content('Google')
  end
end
