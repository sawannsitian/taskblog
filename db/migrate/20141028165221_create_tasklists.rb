class CreateTasklists < ActiveRecord::Migration
  def change
    create_table :tasklists do |t|
      t.string :subject
      t.string :status
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :tasklists, :tasklist_id
  end
end
