class AddProjectToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_reference :integrations, :project, null: true, foreign_key: true
  end
end
