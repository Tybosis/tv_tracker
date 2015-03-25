class ChangeColumnEpisodesShowsTable < ActiveRecord::Migration
  def self.up
    change_column :shows, :episodes, :text
  end

  def self.down
    change_column :shows, :episodes, :string
  end
end
