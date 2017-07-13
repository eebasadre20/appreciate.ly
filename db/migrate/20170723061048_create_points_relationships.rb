class CreatePointsRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :points_relationships do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.integer :points
    end

    add_index :points_relationships, :giver_id
    add_index :points_relationships, :receiver_id
  end
end
