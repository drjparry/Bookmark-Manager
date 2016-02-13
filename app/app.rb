ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookMarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash



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
    @user = User.new
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.name
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up

    end
  end

   get '/log_in' do
    erb :log_in
   end

   post '/log_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.name
      redirect to('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end

   end




run! if app_file == $0
end