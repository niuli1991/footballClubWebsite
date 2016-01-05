class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :new_title
      t.string :new_content
      t.string :new_type
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
