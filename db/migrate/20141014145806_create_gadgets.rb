class CreateGadgets < ActiveRecord::Migration
  def change
      create_table :gadgets do |t|
        t.string :name
        t.text :description
        t.integer :user_id
        t.timestamps
      end
      add_index :gadgets, :user_id
  end
end
