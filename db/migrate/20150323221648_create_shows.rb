class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :air_time
      t.string :status
      t.string :next_episode
      t.string :overview
      t.string :banner
      t.string :poster

      t.timestamps null: false
    end
  end
end
