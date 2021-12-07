class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true

      t.string :user_name, null: false, limit: 15
      t.string :Introduction, null: false, limit: 255

      t.timestamps
    end
  end
end
