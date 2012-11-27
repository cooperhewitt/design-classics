class CreateTypesOfThing < ActiveRecord::Migration
  def change
    create_table :types_of_thing do |t|
      t.string :name, :null => false
      t.integer :things_count, :null => false, :default => 0
      t.integer :ch_id

      t.timestamps
    end

    add_index :types_of_thing, :name, :unique => true
    add_index :types_of_thing, :ch_id, :unique => true

  end
end
