class AddNamesToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :first_name)
      add_column :users, :first_name, :string, null: false, limit: 255 
    end
    
    unless column_exists?(:users, :last_name)
      add_column :users, :last_name, :string, null: false, limit: 255 
    end
  end
end










