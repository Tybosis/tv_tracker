class RenameNextEpisodeInShows < ActiveRecord::Migration
  def self.up
    rename_column :shows, :next_episode, :episodes
  end

  def self.down
    rename_column :shows, :episodes, :next_episode
  end
end
