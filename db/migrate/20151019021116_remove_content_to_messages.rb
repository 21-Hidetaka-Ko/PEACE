class RemoveContentToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :content, :string
  end
end
