class Show < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  serialize :episodes

  def update_episodes
    show = TVDB.get_series_by_id(self.series_id)
    self.episodes = show.episodes.last(20)
    self.save
  end
end
