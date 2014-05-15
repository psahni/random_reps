json.array!(@cpu_types) do |cpu_type|
  json.extract! cpu_type, :id, :processor, :core_amount, :cpu_conf_id
  json.url cpu_type_url(cpu_type, format: :json)
end
