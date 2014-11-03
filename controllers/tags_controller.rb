require 'pry'

class TagsController < ApplicationController

  # get all tags from all blogs
  get '/:id' do
    @tag = Tag.find(params[:id])
    @tagposts = Tagpost.where(tag_id: params[:id])
    @pages = Page.all
    @tags = Tag.all
    @users = User.all
    erb :'tags/index'
  end

  get '/:user_id/:tag_id' do
    @tag = Tag.find(params[:tag_id])
    @user = User.find(params[:user_id])
    @tagposts = Tagpost.where(tag_id: params[:tag_id])
    @pages = Page.all
    @tags = Tag.all
    @users = User.all
    erb :'tags/user'
  end

end