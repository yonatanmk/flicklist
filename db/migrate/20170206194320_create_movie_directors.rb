class CreateMovieDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_directors do |t|
      t.belongs_to :movie, null: false
      t.belongs_to :director, null: false
    end
  end
end
