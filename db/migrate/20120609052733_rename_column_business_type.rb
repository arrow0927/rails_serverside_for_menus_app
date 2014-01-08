class RenameColumnBusinessType < ActiveRecord::Migration
  def up
    rename_column :listings, :businessType, :business_type
    rename_column :listings, :subType, :sub_type
    
  end

  def down
  end
end
