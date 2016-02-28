class AddHostImageToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :host_image, :string
  end
end
