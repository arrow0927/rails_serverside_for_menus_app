class AddUrlToDb < ActiveRecord::Migration
  def change
    add_column :listings, :url, :string, :default=> nil
    add_column :listings, :get_menu_from_website?, :boolean, :default => true
    
  end
end
