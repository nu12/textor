class CreateTemplates < ActiveRecord::Migration["#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :description
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end
  end
end
