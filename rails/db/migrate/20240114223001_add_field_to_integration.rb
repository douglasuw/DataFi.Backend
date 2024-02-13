class AddFieldToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_reference :integrations, :field, null: true, foreign_key: true
  end
end
