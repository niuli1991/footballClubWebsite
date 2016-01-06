class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :content
      t.string :annou_type
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
