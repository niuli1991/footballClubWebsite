class AddGuestImageToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :guest_image, :string
  end
end
