class AddUserProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_past, :string
    add_column :users, :user_why, :string
    add_column :users, :user_finish, :string
  end
end
