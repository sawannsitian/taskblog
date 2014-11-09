class Addcolumntouser < ActiveRecord::Migration
  def up
  	rename_column :users, :lat, :latitude
  	rename_column :users, :long, :longitude
  	add_column :users, :email, :string

  end

  def down
  end
end
