class AddConfirmEmail < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :email_confirmed, :boolean, default: false
    add_column :authors, :confirm_token, :string
  end
end
