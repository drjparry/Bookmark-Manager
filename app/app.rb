ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookMarkManager < Sinatra::Base
  enable :sessions



  get '/' do
    redirect('/links')
  end

  get '/links' do
    @current_user = session[:user_id]
    @links = Link.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params['Title'], url: params['Link'])
    params[:Tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect('/links')
  end

  get '/links/new' do
    erb :links_new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    session[:user_id] = user.name
    redirect '/links'
  end





run! if app_file == $0
end