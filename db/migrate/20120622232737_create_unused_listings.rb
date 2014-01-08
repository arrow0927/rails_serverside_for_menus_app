class CreateUnusedListings < ActiveRecord::Migration
  def change
    create_table :unused_listings do |t|
     
     t.string :name
     t.string :telephone
     t.string :fax
     t.string :suite
     t.string :address
     t.string :city
     t.string :province
     t.string :postal_code
     t.string :latitude
     t.string :longitude
     t.string :business_type
     t.string :sub_type
     t.string :owner
     t.string :source
     t.string :local_area
     t.boolean :checked
     t.boolean :menu_collected
     t.boolean :menu_digitized
     t.boolean :menu_in_database
     t.boolean :keep
     t.boolean :get_menu_from_website
     t.text :notes
     t.string :menu_state
     t.string :menu_source
     
     
      t.timestamps
    end
  end
end
