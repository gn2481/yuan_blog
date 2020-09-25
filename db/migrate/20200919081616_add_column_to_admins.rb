class AddColumnToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :avatar, :string
    add_column :admins, :email, :string
    add_column :admins, :introduction, :string
    add_column :admins, :experience, :string
  end
end
