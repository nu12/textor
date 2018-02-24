class CreateTemplateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :template_sections do |t|
      t.references :template, foreign_key: true
      t.references :section, foreign_key: true
      t.integer :position
      t.boolean :is_mandatory

      t.timestamps
    end
  end
end
