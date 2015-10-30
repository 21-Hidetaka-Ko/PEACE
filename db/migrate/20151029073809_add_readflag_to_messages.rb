class AddReadflagToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :readflag, :integer
  end
end
