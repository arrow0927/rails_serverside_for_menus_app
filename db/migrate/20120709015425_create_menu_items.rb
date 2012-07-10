class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :listing_name
      t.string :category_1
      t.string :category_2
      t.string :category_3
      t.string :menu_item_name
      t.string :price
      t.string :description
      t.string :add_on_1
      t.string :price_add_on_1
      t.string :add_on_2
      t.string :price_add_on_2
      t.text :notes
      t.string :typist
      t.string :source


      t.timestamps
    end
  end
end
