class AddColumns < ActiveRecord::Migration
  def change
    add_column :posts, :state, :string, default: "preview"
    add_column :users, :state, :string, default: "active"
  end
end
