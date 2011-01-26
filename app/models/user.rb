class User < ActiveRecord::Base
  acts_as_authentic 
  validate :username, :uniqueness => :true, :on =>  :create
  validate :email, :uniqueness => :true, :on => :create
  has_one :gallery
  has_one :avatar
  has_many :images
  has_many :comments
  belongs_to :role

  def to_param
    "#{username}"
  end

end
