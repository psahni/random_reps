json.array!(@gpu_types) do |gpu_type|
  json.extract! gpu_type, :id, :name, :core_amount, :gpu_conf_id
  json.url gpu_type_url(gpu_type, format: :json)
end
