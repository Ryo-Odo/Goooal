class AddImageToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :image, :text
  end
end
