class AddClassicnessScoreToThings < ActiveRecord::Migration
  def change
    add_column :things, :classicness_score, :integer, :null => false, :default => 0
  end
end
