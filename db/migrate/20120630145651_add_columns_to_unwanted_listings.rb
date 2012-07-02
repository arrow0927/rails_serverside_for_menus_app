class AddColumnsToUnwantedListings < ActiveRecord::Migration
  def change
    add_column :unwanted_cities, :name, :string
    add_column :unwanted_cities, :telephone, :string
    add_column :unwanted_cities, :fax, :string
    add_column :unwanted_cities, :suite, :string
    add_column :unwanted_cities, :address, :string
    add_column :unwanted_cities, :city, :string
    add_column :unwanted_cities, :province, :string
    add_column :unwanted_cities, :postal_code, :string
    add_column :unwanted_cities, :latitude, :string
    add_column :unwanted_cities, :longitude, :string
    add_column :unwanted_cities, :business_type, :string
    add_column :unwanted_cities, :sub_type, :string
    add_column :unwanted_cities, :owner, :string
    add_column :unwanted_cities, :source, :string
    add_column :unwanted_cities, :local_area, :string
    add_column :unwanted_cities, :checked, :boolean
    add_column :unwanted_cities, :menu_collected, :boolean
    add_column :unwanted_cities, :menu_digitized, :boolean
    add_column :unwanted_cities, :menu_in_database, :boolean
    add_column :unwanted_cities, :keep, :boolean
    add_column :unwanted_cities, :get_menu_from_website, :boolean
    add_column :unwanted_cities, :notes, :text
    add_column :unwanted_cities, :menu_state, :string
    add_column :unwanted_cities, :menu_source, :string
    
  end
end
