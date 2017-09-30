class CreateCouncilMembers < ActiveRecord::Migration
  def change
        create_table :council_members do |t|
            t.string :name
            t.string :image
            t.string :borough
            t.string :party
            t.string :neighborhoods
        end 
  end
end
