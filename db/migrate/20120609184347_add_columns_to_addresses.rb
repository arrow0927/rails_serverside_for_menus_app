class AddColumnsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :business_name, :string
    add_column :addresses, :address, :string
    add_column :addresses, :telephone_1, :string
    add_column :addresses, :url, :string
    add_column :addresses, :fax, :string
    add_column :addresses, :telephone_2, :string
    
  end
end
