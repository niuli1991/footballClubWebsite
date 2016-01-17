class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image

      t.timestamps null: false
    end
    add_column :pictures,:user_id,:integer
    add_index :pictures, :user_id
  end
end
