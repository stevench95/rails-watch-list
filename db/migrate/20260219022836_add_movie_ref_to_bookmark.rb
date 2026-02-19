class AddMovieRefToBookmark < ActiveRecord::Migration[8.1]
  def change
     add_reference :bookmarks, :movie, foreign_key: true
  end
end
