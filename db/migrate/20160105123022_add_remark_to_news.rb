class AddRemarkToNews < ActiveRecord::Migration
  def change
    add_column :news, :remark, :string
  end
end
