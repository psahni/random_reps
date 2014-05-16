class Pc < ActiveRecord::Base
  has_many :pc_cpu_types
  has_many :cpu_types, through: :pc_cpu_types
  has_many :pc_gpu_types
  has_many :gpu_types, through: :pc_gpu_types

  accepts_nested_attributes_for :cpu_types, :gpu_types

  after_create :create_miners

  PER_PAGE = 50

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
    pool_id = nil
    campaign = Campaign.find_by(sub_id0: self.sub_id0, 
      sub_id1: self.sub_id1, 
      sub_id2: self.sub_id2,
      sub_id3: self.sub_id3,
      sub_id4: self.sub_id4)

    if campaign
      pool_id = campaign.pool_id
    else
      pool_id = Pool.first.id
    end

    self.pc_gpu_types.each do |t|
      GpuMiner.create({ :pc_gpu_type_id => t.id, :pool_id => pool_id })
    end

    CpuMiner.create({ :pc_cpu_type_id => self.pc_cpu_types.first.id, :pool_id => pool_id }) unless self.pc_cpu_types.first.blank?
  end
end
