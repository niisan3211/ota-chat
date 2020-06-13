class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text
      t.text :image
      t.integer :user_id, null: false, foreign_key: true
      t.integer :genru_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
