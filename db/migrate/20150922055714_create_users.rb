class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.integer :sex
      t.text :major
      t.date :birthday
      t.string :password
      t.text :university
      t.string :national

      t.timestamps
    end
  end
end
