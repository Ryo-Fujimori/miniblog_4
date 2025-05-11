class AddParentIdToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :parent, foreign_key: { to_table: :posts }, index: true
  end
end
