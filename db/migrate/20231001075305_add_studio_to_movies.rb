class AddStudioToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :studio, :string
  end
end
