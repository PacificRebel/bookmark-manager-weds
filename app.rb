require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    # Print the ENV variable
    # p ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    url = params['url']
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
    # p "Form data submitted to the /bookmarks route!"
    # p params
  end

  run! if app_file == $0
end
