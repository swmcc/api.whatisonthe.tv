class RemoveProductionCompaniesFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :production_company
  end
end
