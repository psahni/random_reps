class Pc < ActiveRecord::Base
  has_many :pc_cpu_types
  has_many :cpu_types, through: :pc_cpu_types
  has_many :pc_gpu_types
  has_many :gpu_types, through: :pc_gpu_types

  accepts_nested_attributes_for :cpu_types, :gpu_types

  after_create :create_miners

  def gpu_types_attributes=(values)
  	self.gpu_types = values.map { |gpu| GpuType.find(:first, :conditions => { :name => gpu[:name] }) || GpuType.create(gpu) }
	end

	def cpu_types_attributes=(values)
  	self.cpu_types = values.map { |cpu| CpuType.find(:first, :conditions => { :processor => cpu[:processor] }) || CpuType.create(cpu) }
	end

  def self.find_or_create(attributes)
    attributes.merge!(attributes[:campaign])
    attributes.delete(:campaign)
    self.where(mac: attributes[:mac]).first || self.create(attributes)
  end

  def create_miners
      self.pc_gpu_types.each do |t|
        GpuMiner.create({ :pc_gpu_type_id => t.id })
      end

      CpuMiner.create({ :pc_cpu_type_id => self.pc_cpu_types.first.id })
    end
end
