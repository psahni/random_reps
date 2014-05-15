class PcCpuType < ActiveRecord::Base
  belongs_to :pc
  belongs_to :cpu_type
end
