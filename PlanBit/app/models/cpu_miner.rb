class CpuMiner < ActiveRecord::Base
	belongs_to :pc_cpu_type
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
end
