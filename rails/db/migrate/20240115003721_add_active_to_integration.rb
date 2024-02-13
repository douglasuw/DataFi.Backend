class AddActiveToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_column :integrations, :active, :boolean
  end
end
