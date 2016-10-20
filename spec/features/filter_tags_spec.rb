require 'spec_helper'

feature 'filtering tags' do
  before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(tag_name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(tag_name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(tag_name: 'bubbles')])
  end
  scenario "filtering links by tag's name" do

    visit "/links/search"

    fill_in "search_link", :with => "bubbles"
    click_button "Search"

    expect(page).to have_content('This is Zombocom')
    expect(page).to have_content('Bubble Bobble')
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Google')
  end
end
