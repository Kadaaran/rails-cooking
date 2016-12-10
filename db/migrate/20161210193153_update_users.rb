class UpdateUsers < ActiveRecord::Migration[5.0]
  def change
    # la table, le champ à add
    add_column :users, :company_id, :integer
  end
end
