class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
