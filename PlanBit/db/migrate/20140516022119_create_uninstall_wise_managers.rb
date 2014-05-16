class CreateUninstallWiseManagers < ActiveRecord::Migration
  def change
    create_table :uninstall_wise_managers do |t|
      t.integer :pc_id

      t.timestamps
    end
  end
end
