json.array!(@shows) do |show|
  json.extract! show, :id, :name, :air_time, :status, :next_episode, :overview, :banner, :poster
  json.url show_url(show, format: :json)
end
