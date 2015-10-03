class AddUserId < ActiveRecord::Migration
  def change
  	add_column :users, :to_national, :string
    add_column :users, :to_university, :text
  end
end
