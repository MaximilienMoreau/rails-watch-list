class CreateBookmarks < ActiveRecord::Migration[8.1]
  def change
    create_table :bookmarks do |t|
      add_index :bookmarks, [:movie_id, :list_id], unique: true
      t.string :comment
      t.string :null: false
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
