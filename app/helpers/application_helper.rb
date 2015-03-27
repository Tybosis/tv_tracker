module ApplicationHelper
  def flash_class(level)
    level == :notice ? "info" : level.to_s
  end

  def current_next_episode(episodes)
    ans = "No new episodes scheduled"
    episodes.each do |episode|
      if episode.air_date.present? && episode.air_date >= Date.today
        return episode.air_date.to_formatted_s(:long)
      end
    end
    ans
  end

  def is_playing_on?(today, episodes)
    episodes.detect do |episode|
      episode.air_date == today
    end
  end
end
