class CreateUsersGenrus < ActiveRecord::Migration[5.2]
  def change
    create_table :users_genrus do |t|
      t.references :user,    null: false,foreign_key: true
      t.references :genru,   null: false,foreign_key: true
      t.timestamps
    end
  end
end
