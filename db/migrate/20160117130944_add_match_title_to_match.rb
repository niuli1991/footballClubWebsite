class AddMatchTitleToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :match_title, :string
  end
end
