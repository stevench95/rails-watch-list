class AddListRefToBookmark < ActiveRecord::Migration[8.1]
  def change
         add_reference :bookmarks, :list, foreign_key: true
  end
end
