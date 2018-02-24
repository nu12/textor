class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :name
      t.string :hash_name
      t.references :user, foreign_key: true
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
