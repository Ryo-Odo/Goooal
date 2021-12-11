class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :goal_title, null: false, limit: 45
      t.string :description, limit: 255
      t.timestamps
    end
  end
end
