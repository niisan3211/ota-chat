class CreateGroupTags < ActiveRecord::Migration[5.2]
  def change
    create_table :group_tags do |t|
      t.references :tag,     null: false,foreign_key: true
      t.references :group,   null: false,foreign_key: true
      t.timestamps
    end
  end
end
