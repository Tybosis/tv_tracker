class AddSeriesIdToShow < ActiveRecord::Migration
  def change
    add_column :shows, :series_id, :integer
  end
end
