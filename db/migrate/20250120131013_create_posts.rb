class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :item
      t.integer :amount
      t.string :introduction
      t.timestamps
    end
  end
end
