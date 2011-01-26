class Avatar < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, :styles => { :vsmall => "70x60>",
                                         :small => "150x150>",
                                         :thumb => "250x250>",
                                         :original => "350x350>"},
 :url  => "/avatars/:id/:style/:basename.:extension",
 :path => ":rails_root/public/avatars/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 2.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
