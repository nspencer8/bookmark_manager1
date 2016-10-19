require 'spec_helper'

  feature 'link page' do
    scenario 'page has links' do

      visit "/"
      click_button "Sign In"
      Link.create(url: 'http://www.google.com', title: 'Google')

      expect(page).to have_content('Google')
    end
  end
