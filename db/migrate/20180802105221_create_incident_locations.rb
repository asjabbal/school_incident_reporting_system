class CreateIncidentLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_locations do |t|
    	t.timestamps
    	
      t.references :incident, foreign_key: true
      t.integer :location
      t.string :other_location
    end
  end
end
