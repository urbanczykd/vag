class User < ActiveRecord::Base
  acts_as_authentic
  validate :username, :uniqueness => :true
  validate :email, :uniqueness => :true

  def to_param
    "#{username}"
  end

end
