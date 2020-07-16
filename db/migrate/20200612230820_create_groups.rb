class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :ota_rank, null: false
      t.references :genru, null: false, foreign_key: true
      t.string :comment
      t.timestamps
    end
    add_index :groups, [:name], unique: true
  end
end
