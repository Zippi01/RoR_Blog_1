class ChangeTypeAuthorId < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :author_id, :integer
  end
end
