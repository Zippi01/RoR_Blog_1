class ChangeNameToAuthorId < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :name, :author_id


  end
end
