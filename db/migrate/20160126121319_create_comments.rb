class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :content, null: false
      t.string :state, null: false, default: "visible"

      t.timestamps null: false
    end
  end
end
