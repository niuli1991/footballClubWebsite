class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :news_title
      t.text :news_content
      t.string :news_type
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
