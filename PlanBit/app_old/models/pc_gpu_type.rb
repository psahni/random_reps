class PcGpuType < ActiveRecord::Base
  belongs_to :pc
  belongs_to :gpu_type
end
