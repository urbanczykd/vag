class Image < ActiveRecord::Base
  belongs_to :article
  belongs_to :gallery
#  acts_as_list :scope => :gallery
  
  has_attached_file :photo, :styles => { :vsmall => "100x100>",
                                         :thumb => "150x150>",
                                         :small => "300x300>",
                                         :oryginal => "800x600>"},
                  :url  => "/gallery/image/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/gallery/image/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
