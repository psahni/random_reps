class AddUpdateIntervalMinsToMiners < ActiveRecord::Migration
  def change
  	add_column :gpu_miners, :update_interval_mins, :integer
  	add_column :cpu_miners, :update_interval_mins, :integer
  end
end
