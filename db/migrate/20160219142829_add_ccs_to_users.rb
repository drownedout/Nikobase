class AddCcsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ccs_type, :string
    add_column :users, :ccs_date, :date
  end
end
