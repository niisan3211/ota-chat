class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :ota_rank, null: false
      t.integer :genru_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :groups, :name, unique: true
  end
end
