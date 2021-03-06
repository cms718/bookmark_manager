# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

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

  get '/bookmarks/:id/edit' do
    @id = params[:id]
    erb(:edit_bookmark)
  end

  post '/bookmarks' do
    Bookmark.create(params['url'], params['title'])
    redirect('/bookmarks')
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params['url'], params['title'], params[:id])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect('/bookmarks')
  end
end
