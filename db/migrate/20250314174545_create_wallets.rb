class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.string :address
      t.decimal :balance

      t.timestamps
    end
  end
end
