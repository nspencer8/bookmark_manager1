require 'spec_helper'

feature 'adding a new tag' do
  scenario 'add a single tag to a new link' do

    visit "/links/new"

    fill_in "new_url", :with => "http://www.github.com"
    fill_in "new_title", :with => 'Github'
    fill_in "tags", :with => 'social media'
    click_button "Submit"

    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('social media')
  end
end
