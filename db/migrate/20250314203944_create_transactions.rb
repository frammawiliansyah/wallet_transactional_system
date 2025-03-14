class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.string :code, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false, default: 0
      t.bigint :source_wallet_id
      t.bigint :target_wallet_id
      t.timestamps
    end

    add_index :transactions, :code, unique: true
    add_index :transactions, [:source_wallet_id, :target_wallet_id]
  end
end
