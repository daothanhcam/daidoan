class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 3, null: false
  end
end
