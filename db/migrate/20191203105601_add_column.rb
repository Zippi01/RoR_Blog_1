class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :value, :integer
  end
end
