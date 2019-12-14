class AddPassTime < ActiveRecord::Migration[6.0]
  def change
    add_column :authors,:pass_time, :datetime
  end
end
