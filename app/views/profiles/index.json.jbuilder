json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :email, :address, :city, :state, :zip
  json.url profile_url(profile, format: :json)
end
