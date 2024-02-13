class AddExpireDateToIntegration < ActiveRecord::Migration[7.0]
  def change
    add_column :integrations, :token_expire_date, :date
  end
end
