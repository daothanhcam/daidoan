class ChangeConveration < ActiveRecord::Migration
  def change
    add_column :converations, :friend_id, :integer, null: false
  end
end
