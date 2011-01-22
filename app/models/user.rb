class User < ActiveRecord::Base
  acts_as_authentic
  validate :username, :uniqueness => :true
  validate :email, :uniqueness => :true
  has_one :gallery
  has_many :images
  has_many :comments

  def to_param
    "#{username}"
  end

end
