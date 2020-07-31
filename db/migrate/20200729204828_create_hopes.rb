class CreateHopes < ActiveRecord::Migration[5.2]
  def change
    create_table :hopes do |t|
      t.integer :hope,null: false
      # 参加希望したuser↑
      t.integer :group,null: false
      # 希望されたgroup↑
      t.integer :group_reader,null: false
      # 希望グループリーダーのid↑
      t.integer :pass_fail
      # グループリーダーが参加したか否か↑
      t.text :comment,null: false
      # 参加希望したuserからのcomment↑
      t.timestamps
    end
  end
end
