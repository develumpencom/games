class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.references :list, null: false, foreign_key: true
      t.references :listable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
