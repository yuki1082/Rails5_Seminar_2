class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
    	t.integer :user_id, null: false 
    	t.integer :plan_item_id, null: false
    	t.boolean :canceled, null: false, default: false
      t.timestamps
    end

    add_index :participations, [:user_id]
    add_index :participations, [:plan_item_id]
  end


end
