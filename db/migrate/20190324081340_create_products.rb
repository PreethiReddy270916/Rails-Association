class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
