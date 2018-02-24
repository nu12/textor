class CreateSectionFields < ActiveRecord::Migration[5.2]
  def change
    create_table :section_fields do |t|
      t.references :section, foreign_key: true
      t.references :field, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
