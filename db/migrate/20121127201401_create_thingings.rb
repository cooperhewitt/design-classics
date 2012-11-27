class CreateThingings < ActiveRecord::Migration
  def change
    create_table :thingings do |t|
      t.integer :thing_id, :null => false
      t.integer :type_of_thing_id, :null => false

      t.timestamps
    end

    add_index :thingings, [:thing_id, :type_of_thing_id], :unique => true

  end
end
