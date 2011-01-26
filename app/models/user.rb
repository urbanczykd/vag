class User < ActiveRecord::Base
  acts_as_authentic
  validate :username, :uniqueness => :true
  validate :email, :uniqueness => :true
  has_one :gallery
  has_one :avatar
  has_many :images
  has_many :comments
  belongs_to :role

  def to_param
    "#{username}"
  end

end
