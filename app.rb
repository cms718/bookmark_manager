# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/bookmarks' do
    Bookmark.create(params['url'], params['title'])
    redirect('/bookmarks')
  end
end
