class UninstallWiseManager < ActiveRecord::Base
  validates :pc_id, :presence => true
  validates_numericality_of :pc_id, :unless => lambda{|obj| obj.pc_id.blank? }


  validate :pc_id_uniqueness, :on => :create

  def uninstalled_at
    created_at.utc.strftime("%c")
  end


  protected

	def pc_id_uniqueness
		unless UninstallWiseManager.where('pc_id = ?', self.pc_id).blank?
			self.errors.add(:pc_id, "Uninstallation has already been done with this pc_id")
		end
	end

end
