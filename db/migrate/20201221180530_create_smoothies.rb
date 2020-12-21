class CreateSmoothies < ActiveRecord::Migration
  def change
    create_table :smoothies do |t|
      t.string :name
      t.string :recipe
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
