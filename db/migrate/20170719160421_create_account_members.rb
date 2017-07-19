class CreateAccountMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :account_members do |t|
      t.integer :user_id
      t.integer :account_id
      t.string  :role

      t.timestamps
    end

    add_index :account_members, :user_id
    add_index :account_members, :account_id
    add_index :account_members, [:user_id, :account_id], unique: true
  end
end
