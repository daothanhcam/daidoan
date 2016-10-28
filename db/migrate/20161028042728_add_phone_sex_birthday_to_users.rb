class AddPhoneSexBirthdayToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer
    add_column :users, :birthday, :string
    add_column :users, :phone, :string
  end
end
