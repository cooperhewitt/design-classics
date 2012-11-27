class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name, :null => false
      t.integer :ch_id
      t.string :image
      t.text :description

      t.timestamps
    end

    add_index :things, :ch_id, :unique => true

  end
end
