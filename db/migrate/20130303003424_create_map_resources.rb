class CreateMapResources < ActiveRecord::Migration
  def change
    create_table :map_resources do |t|

      t.string :text

	  t.integer :user_id
      t.integer :resource_id
      t.integer :map_id
      t.integer :map_objective_id
      
      t.timestamps
    end
  end
end
