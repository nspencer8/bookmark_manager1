require 'sinatra/base'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @view_links = Link
    erb :index
  end

end
