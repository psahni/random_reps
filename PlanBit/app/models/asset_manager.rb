class AssetManager < ActiveRecord::Base


    def updated?(current_version)
      current_version = current_version.to_i
      if self.version > current_version
        return true
      else
        return false
      end
    end


   def self.max_version
     AssetManager.order('version desc').first
   end



end
