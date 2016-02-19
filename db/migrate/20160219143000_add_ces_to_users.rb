class AddCesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ces_type, :string
    add_column :users, :ces_date, :date
  end
end
