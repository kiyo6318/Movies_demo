class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.bigint :movie_id
      t.string :title
      t.text :content
    end
  end
end
