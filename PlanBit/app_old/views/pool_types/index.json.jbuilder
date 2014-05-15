json.array!(@pool_types) do |pool_type|
  json.extract! pool_type, :id, :id, :name, :algo
  json.url pool_type_url(pool_type, format: :json)
end
