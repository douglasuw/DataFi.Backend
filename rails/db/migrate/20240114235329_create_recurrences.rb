class CreateRecurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :recurrences do |t|
      t.string :name

      t.timestamps
    end
  end
end
