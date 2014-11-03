class Page < ActiveRecord::Base
  belongs_to :users
  has_many :tagposts
  has_many(:tags, :through => :tagposts)

# attr_accessor :header, :article, :tag

#   def initialize(options={})
#     @header = options[:header]
#     @article = options[:article]
#     @tag = options[:tag]
#   end

end