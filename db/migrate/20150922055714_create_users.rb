class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.string :national
      t.text :university
      t.text :major
      t.string :password
      t.timestamps
    end
  end
end
