class UninstallWiseManager < ActiveRecord::Base
  validates :pc_id, :presence => true
  validates_numericality_of :pc_id, :unless => lambda{|obj| obj.pc_id.blank? }

  def uninstalled_at
    created_at.utc.strftime("%c")
  end

end
