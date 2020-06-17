class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text
      t.text :image
      t.references :user, null: false, foreign_key: true
      t.references :genru, null: false, foreign_key: true
      t.timestamps
    end
  end
end
