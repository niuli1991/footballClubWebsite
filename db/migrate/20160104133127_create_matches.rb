class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :match_type
      t.string :host_team
      t.string :guest_team
      t.date :kick_of_time
      t.string :place
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
