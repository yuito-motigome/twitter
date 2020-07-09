class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.text :user_id
      t.text :post_id

      t.timestamps
    end
  end
end
