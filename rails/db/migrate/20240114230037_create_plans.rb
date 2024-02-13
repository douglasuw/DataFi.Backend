class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :title
      t.decimal :month_value
      t.decimal :year_value
      t.boolean :recommend
      t.integer :month_discount_percentual
      t.integer :year_discount_percentual
      t.decimal :year_discount_value
      t.decimal :month_discount_value

      t.timestamps
    end
  end
end
