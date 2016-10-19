require 'spec_helper'

feature 'submit a new link' do
  scenario 'fill out form and submit link' do
    Link.create(url: 'http://www.google.com', title: 'Google')

    visit "/links/new"
    fill_in "URL", :with => "http://www.google.com"
    fill_in "Title", :with => "Google"
    click_button "Submit"
    expect(page).to have_content('Google')
  end
end
