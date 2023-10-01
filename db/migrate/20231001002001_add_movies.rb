# frozen_string_literal: true

class AddMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :external_id, null: false
      t.string :name, null: false
      t.string :synposis, null: true
      t.string :poster, null: true
      t.string :status, null: true
      t.string :released, null: true
      t.string :rating, null: true
      t.string :runtime, null: true
      t.string :production_company, null: true
      t.timestamps
    end
  end
end
