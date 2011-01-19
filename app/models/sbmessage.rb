class Sbmessage < ActiveRecord::Base
  validates :message, :presence => true
  validates :user_id, :presence => true

end
