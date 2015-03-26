class CreateProfilesShows < ActiveRecord::Migration
  def change
    create_table :profiles_shows, id: false do |t|
      t.references :profile, :show
    end

    add_index :profiles_shows, [:profile_id, :show_id]
  end
end
