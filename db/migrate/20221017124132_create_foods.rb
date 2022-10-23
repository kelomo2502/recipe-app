class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name,              null: false, default: "food"
      t.string :measurement_unit,   null: false, default: "gram"
      t.integer :price,   null: false, default: ""
      t.integer :quantity
      t.timestamps
    end
  end
end
