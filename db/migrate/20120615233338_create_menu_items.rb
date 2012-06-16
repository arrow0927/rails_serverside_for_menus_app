class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :listing_name
      t.string :description
      t.string :price
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :addOn1
      t.string :addOn1price
      t.string :addOn2
      t.string :addOn2price

      t.timestamps
    end
  end
end
