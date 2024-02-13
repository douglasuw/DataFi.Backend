class CreateFieldTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :field_templates do |t|
      t.string :name
      t.json :data
      t.references :data_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
