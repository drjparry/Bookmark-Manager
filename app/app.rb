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







run! if app_file == $0
end