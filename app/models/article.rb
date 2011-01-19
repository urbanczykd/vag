class Article < ActiveRecord::Base
  acts_as_list
  validates :title, :presence => true
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
