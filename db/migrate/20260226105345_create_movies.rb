class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      add_index :movies, :title, unique: true
      t.string :title
      t.text :overview
      t.string :poster_url
      t.float :rating

      t.timestamps
    end
  end
end
