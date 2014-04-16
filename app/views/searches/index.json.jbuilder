json.array!(@searches) do |search|
  json.extract! search, :id, :category_id, :personality_id
  json.url search_url(search, format: :json)
end
