class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :username, :email, :password, :role, :string
  end
end
