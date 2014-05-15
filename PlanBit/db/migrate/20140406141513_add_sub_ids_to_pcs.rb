class AddSubIdsToPcs < ActiveRecord::Migration
  def change
  	add_column :pcs, :sub_id0, :integer
  	add_column :pcs, :sub_id1, :integer
  	add_column :pcs, :sub_id2, :integer
  	add_column :pcs, :sub_id3, :integer
  	add_column :pcs, :sub_id4, :integer
  end
end
