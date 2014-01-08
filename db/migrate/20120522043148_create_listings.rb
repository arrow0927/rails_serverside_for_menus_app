class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      
      t.string :name, :default => "Not Available"
      t.string :telephone, :default => "Not Available"
      t.string :fax, :default => "Not Available"
      t.string :suite, :default => "Not Available"
      t.string :address, :default => "Not Available"
      t.string :city, :default => "Not Available"
      t.string :province, :default => "Not Available"
      t.string :postal_code, :default => "Not Available"
      t.string :latitude, :default => "Not Available"
      t.string :longitude, :default => "Not Available"
      t.string :businessType, :default => "Not Available"
      t.string :subType, :default => "Not Available"
      t.string :owner, :default => "Not Available"
      t.string :source, :default => "Not Available"
      t.string :localArea, :default => "Not Available"
      t.timestamps
    end
  end
end
