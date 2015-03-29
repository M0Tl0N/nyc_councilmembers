class CreatePigs < ActiveRecord::Migration
  def change
    create_table :pigs do |t|
      t.string :name
      t.string :weight
      t.string :past_life_identity
      t.belongs_to :farmer
    end
  end
end
