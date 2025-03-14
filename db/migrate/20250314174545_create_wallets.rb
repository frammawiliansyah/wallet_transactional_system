class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.string :address, null: false
      t.decimal :balance, precision: 15, scale: 2, null: false, default: 0
      t.timestamps
    end

    add_index :wallets, :address, unique: true
  end
end
