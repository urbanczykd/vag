class Article < ActiveRecord::Base
  acts_as_list
  validates :title, :presence => true
  has_many :images
  has_many :galleries
  
  def to_param
    "#{id}-#{title.parameterize}"
  end

end
