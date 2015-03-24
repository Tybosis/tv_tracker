class SimplifyProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :email
    remove_column :profiles, :address
    remove_column :profiles, :city
    remove_column :profiles, :state
    remove_column :profiles, :zip
  end
end
