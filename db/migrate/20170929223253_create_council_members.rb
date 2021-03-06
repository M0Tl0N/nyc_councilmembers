class CreateCouncilMembers < ActiveRecord::Migration
  def change
        create_table :council_members do |t|
            t.string :name
            t.string :image
            t.string :link
            t.string :borough
            t.string :party
            t.string :neighborhoods
            t.boolean :participating?
        end 
  end
end
