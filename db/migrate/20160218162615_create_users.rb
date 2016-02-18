class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id_number
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :company

      t.timestamps null: false
    end
  end
end
