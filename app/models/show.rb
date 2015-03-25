class Show < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  serialize :episodes

  def current_next_episode(episodes)
    ans = "No new episodes scheduled"
    episodes.each do |episode|
      if episode.air_date.present? && episode.air_date >= Date.today
        return episode.air_date.to_formatted_s(:long)
      end
    end
    ans
  end
end
