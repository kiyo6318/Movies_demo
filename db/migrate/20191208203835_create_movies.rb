class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table(:movies,id: false) do |t|
      t.bigint :movie_id
      t.string :title
    end
  end
end
