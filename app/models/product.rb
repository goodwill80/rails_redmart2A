class Product < ApplicationRecord
has_many :microposts, dependent: :destroy
validates_format_of :content_type, :with => /image/,
:message => "You can only upload pictures"

def pictureimage (picture_field)
  return if picture_field.blank?
  self.content_type = picture_field.content_type.chomp
  self.picture = picture_field.read
end



end
