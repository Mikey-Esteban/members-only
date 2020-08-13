class AddBlurbToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :blurb, :text
  end
end
