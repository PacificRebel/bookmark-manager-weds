require 'pg'
require 'sinatra/base'
require './lib/bookmark'
require './database_connection_setup'

class Bookmarks < Sinatra::Base

enable :sessions, :method_override

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    # Print the ENV variable
    # p ENV
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
    # p "Form data submitted to the /bookmarks route!"
    # p params
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
