json.array!(@pools) do |pool|
  json.extract! pool, :id, :pool_type_id, :hostname, :port, :username, :password
  json.url pool_url(pool, format: :json)
end
