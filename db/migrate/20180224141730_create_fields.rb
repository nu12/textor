class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :label
      t.boolean :is_multivalue
      t.string :default
      t.string :open_tag
      t.string :close_tag

      t.timestamps
    end
  end
end
