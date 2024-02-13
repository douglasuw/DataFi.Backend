class CreatePlanTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_teams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :payment_method, null: false, foreign_key: true
      t.boolean :active
      t.decimal :value

      t.timestamps
    end
  end
end
