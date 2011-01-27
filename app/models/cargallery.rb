class Cargallery < ActiveRecord::Base
  belongs_to :user
  has_many :carimages
end
