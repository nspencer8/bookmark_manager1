ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require_relative 'models/tag'
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
     link = Link.create(url: params[:new_url], title: params[:new_title])
     tag = Tag.first_or_create(tag_name: params[:new_tag])
     link.tags << tag
     link.save
     redirect '/links'
  end

  get "/links/new" do
    erb :new_link
  end

  get "/links/search" do
    erb :'search_link'
  end

  get "/tags/:search_link" do
    tag = Tag.first(tag_name: params[:search_link] )
    @links = tag ? tag.links : []
    erb :link
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
