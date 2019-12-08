class AddMovieIdToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :movie_id, :bigint
  end
end
