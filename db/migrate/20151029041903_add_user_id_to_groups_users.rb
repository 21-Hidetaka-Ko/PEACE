class AddUserIdToGroupsUsers < ActiveRecord::Migration
  def change
    add_column :groups_users, :read_at, :datetime
  end
end
