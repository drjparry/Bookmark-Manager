ENV["RACK_ENV"] ||= "development"

require './app/models/link'
require 'sinatra/base'

class BookMarkManager < Sinatra::Base

  get '/' do
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    Link.create(title: params['Title'], url: params['Link'])
    redirect('/links')
  end

  get '/links/new' do
    erb :links_new
  end







run! if app_file == $0
end