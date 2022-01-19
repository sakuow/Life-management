class CreateSpends < ActiveRecord::Migration[5.2]
  def change
    create_table :spends do |t|
      t.integer :user_id
      t.string :body
      t.integer :money

      t.timestamps
    end
  end
end
