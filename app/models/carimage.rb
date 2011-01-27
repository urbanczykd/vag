class Carimage < ActiveRecord::Base
  belongs_to :cargallery
  acts_as_list :scope => :cargallery
  
    has_attached_file :photo, :styles => {
                                         :vsmall => "150x150>",
                                         :small => "300x300>",
                                         :thumb => "640x480>",
                                         :original => "800x600>"},
 :url  => "/carimages/:id/:style/:basename.:extension",
 :path => ":rails_root/public/carimages/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
