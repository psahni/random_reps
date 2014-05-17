class GpuMiner < ActiveRecord::Base
	belongs_to :pc_gpu_type
	belongs_to :pool

	before_create :set_params
	before_save :update_end_time

	def set_params
		self.start_datetime = Time.now
		self.total_time = 0
		self.shares = 0
		self.hashrate = 0
	end

	def update_end_time
		self.end_datetime = Time.now
  end

  def get_miner(gpu_type_id)
    miner = GpuMiner.includes(:pc_gpu_type, :pool, pool: :pool_type, pc_gpu_type: [:gpu_type, gpu_type: :gpu_conf] \
                      ).find_by_pc_gpu_type_id(gpu_type_id)

    conf = miner.pc_gpu_type.gpu_type.gpu_conf
    #max_usage = conf.max_gpu

    pool      = miner.pool
    pool_type = pool.pool_type

    response = { :max_temp => conf.max_temp,
                 :max_usage=> conf.max_cpu,
                 :run_only_inactive=>  conf.run_only_inactive,
                  :pool_info => {
                      :hostname => pool.hostname,
                      :port     => pool.port,
                      :username => pool.username,
                      :password => pool.password,
                      :pool_type => {
                          :name => pool_type.name,
                          :algo => pool_type.algo
                      },
                  },
                  :update_interval_mins => miner.update_interval_mins,
                  :send_log => miner.log
    }
    response
  end

end


