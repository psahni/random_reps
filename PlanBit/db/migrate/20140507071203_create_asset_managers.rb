class CreateAssetManagers < ActiveRecord::Migration
  def change
    create_table :asset_managers do |t|
      t.float  :version
      t.string :asset_path
      t.timestamps
    end
  end
end
