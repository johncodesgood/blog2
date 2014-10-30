require 'bundler'
Bundler.require
require 'pry'

require_relative 'connection'
require_relative 'models/user'
require_relative 'models/page'


enable :sessions


get '/' do
  @pages = Page.all
  erb :index
end

get '/new_entry' do
  erb :'entries/new'
end

post '/new_entry' do
  header = params[:header]
  article = params[:article]
  tag = params[:tag]
  page = Page.new({header: header, article: article, tag: tag})
  page.save
  redirect '/profiles'
end

get '/edit_entry/:id' do
  @entry = Page.find(params[:id])
  erb :'entries/edit'
end

post '/edit_entry/:id' do
  header = params[:header]
  article = params[:article]
  tag = params[:tag]
  page = Page.find_by({id: params[:id]})
  page.update({header: header, article: article, tag: tag})
  page.save
  redirect '/profiles'
end

# post '/users' do
#   user = User.new(params[:user])
#   user.password = params[:password]
#   user.save!
#   redirect "/profiles"
# end

post '/entry/:id' do
  Page.destroy(params[:id])
  redirect '/profiles'
end

get '/profiles' do
  if session[:current_user]
    @user = User.find(session[:current_user])
    @pages = Page.all
    erb :'profiles/index'
  else
    redirect '/'
  end
end

get '/console' do
  binding.pry
end

# login form
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by({username: params[:username]})
  if !user
    redirect '/'
  elsif  
    user.password == params[:password]
    session[:current_user] = user.id
    redirect '/profiles'
  else
    redirect '/'
  end
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/'
end

# delete an entry
delete '/entry/:id' do
  Page.destroy(params[:id])
  redirect '/profiles'
end
