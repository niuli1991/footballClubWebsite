class AddFootballScoresToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :football_scores, :string
  end
end
