class CreatePostType < ActiveRecord::Migration
  def change
    create_table :post_types do |t|
      t.string "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
