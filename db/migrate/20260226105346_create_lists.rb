class CreateLists < ActiveRecord::Migration[8.1]
  def change
    create_table :lists do |t|
      add_index :lists, :name, unique: true
      t.string :name
      t.string :comment, null: false
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
