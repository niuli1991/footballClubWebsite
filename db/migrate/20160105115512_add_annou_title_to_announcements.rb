class AddAnnouTitleToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :annou_title, :string
  end
end
