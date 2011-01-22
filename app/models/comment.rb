class Comment < ActiveRecord::Base
    validate :body, :presence => :true  
  
  belongs_to :article
  belongs_to :user
end
