class CreateEmailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_templates do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
