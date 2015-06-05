class SeriesUpdater
  def self.update_all
    series = Show.all
    series.each { |s| s.update_episodes }
  end
end
