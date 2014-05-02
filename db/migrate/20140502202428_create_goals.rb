class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.text :description
      t.integer :user_id, null: false
      t.string :privacy, null: false
      t.string :completed, null: false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
