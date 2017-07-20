class CreatePhoneDetails < ActiveRecord::Migration
  def change
    create_table :phone_details do |t|
      t.text :name
      t.text :processor
      t.integer :storage
      t.integer :battery
      t.decimal :display

      t.timestamps null: false
    end
  end
end
