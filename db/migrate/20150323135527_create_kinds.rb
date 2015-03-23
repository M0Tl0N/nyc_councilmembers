class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name
    end
  end
end
