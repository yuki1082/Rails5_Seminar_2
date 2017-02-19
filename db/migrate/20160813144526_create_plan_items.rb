class CreatePlanItems < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_items do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.timestamps
    end
  end
end
