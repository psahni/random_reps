class AddAvatarToAssetManagers < ActiveRecord::Migration
  def change
    add_column :asset_managers, :avatar, :string
  end
end
