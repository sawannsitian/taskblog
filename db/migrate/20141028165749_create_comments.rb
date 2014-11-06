class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.text :body
      t.references :tasklist

      t.timestamps
    end
    add_index :comments, :tasklist_id
  end
end
