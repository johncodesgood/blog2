require 'pry'

class EntriesController < ApplicationController


get '/new' do
  erb :'entries/new'
end

post '/new' do
  authenticate!
  page = Page.create(params[:page])
  current_user.pages << page
  #what if no tag was input???
  if params[:tag]
    tags = params[:tag]
    tags.split.each do |tag_split| 
      if Tag.find_by(name: tag_split)
        tag = Tag.find_by(name: tag_split)
      else 
        tag = Tag.create(name: tag_split)
      end
      Tagpost.create({page_id: page.id, tag_id: tag.id})
    end
  end
  redirect '/users/profile'
end

get '/edit/:id' do
  @entry = Page.find(params[:id])
  erb :'entries/edit'
end

post '/edit/:id' do
  tag = params[:tag]
  page = Page.find_by({id: params[:id]})
  page.update(params[:page])
  page.save
  redirect '/users/profile'
end

# post '/:id' do
#   Page.destroy(params[:id])
#   redirect '/profiles'
# end

# delete an entry and the associated tagposts
delete '/:id' do
  while Tagpost.all.find_by(page_id: params[:id])
    delete_tagpost = Tagpost.all.find_by(page_id: params[:id])
    Tagpost.destroy(Tagpost.all.find_by(page_id: params[:id]).id)
    if Tagpost.all.find_by(tag_id: delete_tagpost.tag_id) == nil
      Tag.destroy(delete_tagpost.tag_id)
    end
  end
  Page.destroy(params[:id])

  redirect '/users/profile'
end

end