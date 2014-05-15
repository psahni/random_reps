class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :sub_id0
      t.integer :sub_id1
      t.integer :sub_id2
      t.integer :sub_id3
      t.integer :sub_id4
      t.integer :pool_id

      t.timestamps
    end
    
    add_index "campaigns", ["pool_id"], name: "pool_id", using: :btree
  end
end
