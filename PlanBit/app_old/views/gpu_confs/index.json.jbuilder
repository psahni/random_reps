json.array!(@gpu_confs) do |gpu_conf|
  json.extract! gpu_conf, :id, :name, :max_temp, :max_cpu, :run_only_inactive
  json.url gpu_conf_url(gpu_conf, format: :json)
end
