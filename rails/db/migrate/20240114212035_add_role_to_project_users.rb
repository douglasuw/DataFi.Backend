class AddRoleToProjectUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_users, :role, null: true, foreign_key: true
  end
end
