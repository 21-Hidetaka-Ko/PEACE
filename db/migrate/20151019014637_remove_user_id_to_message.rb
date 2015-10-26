class RemoveUserIdToMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :to_user_id, :string
  end
end
