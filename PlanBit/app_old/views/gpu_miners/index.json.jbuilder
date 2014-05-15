json.array!(@gpu_miners) do |gpu_miner|
  json.extract! gpu_miner, :id, :pc_gpu_type_id, :pool_id, :start_datetime, :end_datetime, :total_time, :shares, :log, :update_interval_mins
  json.url gpu_miner_url(gpu_miner, format: :json)
end
