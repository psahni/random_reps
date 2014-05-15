json.array!(@cpu_miners) do |cpu_miner|
  json.extract! cpu_miner, :id, :pc_cpu_type_id, :pool_id, :start_datetime, :end_datetime, :total_time, :shares, :log, :update_interval_mins
  json.url cpu_miner_url(cpu_miner, format: :json)
end
