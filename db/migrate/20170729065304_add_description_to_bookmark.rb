class AddDescriptionToBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :description, :string
  end
end
