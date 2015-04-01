class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :shows
  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async id, key if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform id, key
      painting = Painting.find id
      painting.key = key
      painting.remote_image_url = painting.image.direct_fog_url with_path: true
      painting.save!
      paiting.update_column :image_processed, true
    end
  end
end
