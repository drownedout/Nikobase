class AddMouToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :mou, :boolean
  end
end
