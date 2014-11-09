class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :uid
      t.string :provider
      t.string :salt_pass
      t.string :hash_pass
      t.boolean :active
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :users, :name
    add_index :users, :uid
  end
end
