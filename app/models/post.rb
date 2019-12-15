class Post < ApplicationRecord
  belongs_to :movie, foreign_key: 'movie_id',primary_key: 'movie_id'
end
