class CreateConverations < ActiveRecord::Migration
  def change
    create_table :converations do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
