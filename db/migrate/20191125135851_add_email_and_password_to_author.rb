class AddEmailAndPasswordToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :email, :string, unique: true
    add_column :authors, :password_digest, :string
  end
end
