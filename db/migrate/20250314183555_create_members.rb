class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
