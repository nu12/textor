class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.boolean :is_editable
      t.boolean :is_wysiwyg

      t.timestamps
    end
  end
end
