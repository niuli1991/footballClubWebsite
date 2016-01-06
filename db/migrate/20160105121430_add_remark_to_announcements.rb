class AddRemarkToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :remark, :string
  end
end
