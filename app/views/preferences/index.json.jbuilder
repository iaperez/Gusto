json.array!(@preferences) do |preference|
  json.extract! preference, :id, :location
  json.url preference_url(preference, format: :json)
end
