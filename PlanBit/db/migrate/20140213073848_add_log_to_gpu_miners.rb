class AddLogToGpuMiners < ActiveRecord::Migration
  def change
    add_column :gpu_miners, :log, :text
  end
end
