class AddFavoritorScores < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :favoritor_score, :text
    add_column :members, :favoritor_total, :text
  end
end
