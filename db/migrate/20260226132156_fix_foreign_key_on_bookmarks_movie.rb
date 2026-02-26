class FixForeignKeyOnBookmarksMovie < ActiveRecord::Migration[8.1]
  def change
    # On supprime la FK existante (créée par t.references ... foreign_key: true)
    remove_foreign_key :bookmarks, :movies

    # On la recrée en RESTRICT / NO ACTION (empêche la suppression d'un movie référencé)
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
