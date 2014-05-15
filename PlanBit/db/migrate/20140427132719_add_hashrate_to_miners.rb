class AddHashrateToMiners < ActiveRecord::Migration
  def change
  	add_column :gpu_miners, :hashrate, :integer, :null => false
  	add_column :cpu_miners, :hashrate, :integer, :null => false
  end
end
