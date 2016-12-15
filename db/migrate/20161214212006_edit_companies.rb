class EditCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :created_by, :integer
    add_column :companies, :description, :text
    add_column :companies, :picture, :string
  end
end
