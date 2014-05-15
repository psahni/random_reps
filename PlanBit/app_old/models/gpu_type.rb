class GpuType < ActiveRecord::Base
  has_many :pc_gpu_types
  has_many :pcs, through: :pc_gpu_types

	belongs_to :gpu_conf

  before_create :set_conf_id

	def set_conf_id
		self.gpu_conf_id = 1
	end
end
