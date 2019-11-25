class DeleteUsernameFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :username
  end
end
