class CreateUsersGenrus < ActiveRecord::Migration[5.2]
  def change
    create_table :users_genrus do |t|
      t.integer :user_id,    null: false,foreign_key: true
      t.integer :genru_id,   null: false,foreign_key: true
      t.timestamps
    end
  end
end
