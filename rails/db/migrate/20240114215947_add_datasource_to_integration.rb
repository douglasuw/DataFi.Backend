class AddDatasourceToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_reference :integrations, :data_source, null: false, foreign_key: true
  end
end
