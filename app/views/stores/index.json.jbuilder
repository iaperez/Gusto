json.array!(@stores) do |store|
  json.extract! store, :id, :name, :prices, :busyness, :noise, :adventure, :convenience, :bargain, :website, :description
  json.url store_url(store, format: :json)
end
