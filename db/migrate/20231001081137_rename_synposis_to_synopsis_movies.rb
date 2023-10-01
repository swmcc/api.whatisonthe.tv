class RenameSynposisToSynopsisMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :synposis, :synopsis
  end
end
