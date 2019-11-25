class AddEmailAndPasswordToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :email, :uniq
    add_column :authors, :password_digest, :digest
  end
end
