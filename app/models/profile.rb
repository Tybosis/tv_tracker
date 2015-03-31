class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :shows
  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end
end
