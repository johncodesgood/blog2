class WelcomeController < ApplicationController
 
  get '/' do
    @users = User.all
    @pages = Page.all
    @tags = Tag.all
    @tagposts = Tagpost.all
    erb :index
  end

end