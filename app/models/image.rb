class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :file, styles: { :medium => "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
