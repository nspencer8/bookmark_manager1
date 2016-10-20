ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get "/" do

    erb :'index'
  end

  get '/links' do
    @links = Link.all
    erb :'link'
  end

  post '/links' do
     Link.create(url: params[:new_url], title: params[:new_title])
     redirect '/links'
  end

  get "/links/new" do
    erb :'new_link'
  end




  # start the server if ruby file executed directly

  run! if app_file == $0
end
