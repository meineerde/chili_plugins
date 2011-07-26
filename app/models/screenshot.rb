class Screenshot < ActiveRecord::Base
  has_attached_file :image, :styles => ({
    :thumb => "120x88>",
    :medium => "180x133>",
    :large => "640x480>"
  })
end
