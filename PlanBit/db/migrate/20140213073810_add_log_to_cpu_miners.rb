class AddLogToCpuMiners < ActiveRecord::Migration
  def change
    add_column :cpu_miners, :log, :text
  end
end
