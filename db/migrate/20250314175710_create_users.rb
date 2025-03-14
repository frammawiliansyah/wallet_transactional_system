class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email_address, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
