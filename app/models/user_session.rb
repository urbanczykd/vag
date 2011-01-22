class UserSession < Authlogic::Session::Base
  validate :username, :presence => true
  validate :password, :presence => true
end
