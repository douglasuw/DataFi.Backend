class AddStartDateToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_column :integrations, :token_start_date, :date
  end
end