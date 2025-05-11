class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
    add_index :favorites, [:user_id, :post_id], unique: true
  end
end
