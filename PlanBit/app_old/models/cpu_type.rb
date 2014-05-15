class CpuType < ActiveRecord::Base
  has_many :pc_cpu_types
  has_many :pcs, through: :pc_cpu_types
  
  belongs_to :cpu_conf

  before_save :set_conf_id

	def set_conf_id
		self.cpu_conf_id = 1
	end
end
