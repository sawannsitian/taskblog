class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :uid
      t.string :provider
      t.string :salt_pass
      t.string :hash_pass
      t.string :oauth_token
      t.boolean :active
      t.float :lat
      t.float :long


      t.timestamps
    end
    add_index :users, :name
  end
end
