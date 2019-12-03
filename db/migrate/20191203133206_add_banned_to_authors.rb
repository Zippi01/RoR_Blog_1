class AddBannedToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :banned, :boolean, default: false
  end
end
