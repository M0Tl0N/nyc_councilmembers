class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :restaurant_id
      t.string  :street
      t.string  :city
      t.string  :state
      t.integer :zip
    end
  end
end
