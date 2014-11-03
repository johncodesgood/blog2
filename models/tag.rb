class Tag < ActiveRecord::Base
  has_many :tagposts
  has_many(:pages, :through => :tagposts)
end