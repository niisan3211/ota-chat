class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.text :message_image
      t.references :user,    null: false,foreign_key: true
      t.references :group,   null: false,foreign_key: true
      t.timestamps
    end
  end
end
