class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.references :post, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :actived

      t.timestamps null: false
    end
  end
end
