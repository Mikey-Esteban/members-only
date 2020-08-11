class AddFavoritableScores < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :favoritable_score, :text
    add_column :members, :favoritable_total, :text
    add_column :posts, :favoritable_score, :text
    add_column :posts, :favoritable_total, :text
  end
end
