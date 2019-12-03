class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :likes, :integer
  end
end
