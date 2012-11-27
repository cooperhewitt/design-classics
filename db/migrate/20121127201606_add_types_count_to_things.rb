class AddTypesCountToThings < ActiveRecord::Migration
  def change
    add_column :things, :types_count, :integer
  end
end
