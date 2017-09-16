class ChangeUsersColumns < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :pwd, :string
  end
end
