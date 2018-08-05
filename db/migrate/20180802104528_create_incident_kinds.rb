class CreateIncidentKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_kinds do |t|
    	t.timestamps
    	
      t.references :incident, foreign_key: true
      t.integer :kind
    end
  end
end
