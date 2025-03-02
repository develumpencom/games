class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :bgg_id, null: false
      t.string :bgg_type, null: false
      t.string :name, null: false
      t.string :thumbnail
      t.text :description
      t.string :yearpublished
      t.string :minplayers
      t.string :maxplayers
      t.string :playingtime
      t.string :minplaytime
      t.string :maxplaytime
      t.string :minage
      t.jsonb :categories
      t.jsonb :mechanics
      t.jsonb :expansions
      t.jsonb :designers
      t.jsonb :artists
      t.jsonb :publishers

      t.timestamps
    end
  end
end
