json.array!(@cpu_confs) do |cpu_conf|
  json.extract! cpu_conf, :id, :name, :max_temp, :max_gpu, :run_only_inactive
  json.url cpu_conf_url(cpu_conf, format: :json)
end
