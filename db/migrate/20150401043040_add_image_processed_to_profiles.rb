class AddImageProcessedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :image_processed, :boolean
  end
end
