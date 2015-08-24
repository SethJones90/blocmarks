class AddBookmarkpicToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :bookmarkpic, :string
  end
end
