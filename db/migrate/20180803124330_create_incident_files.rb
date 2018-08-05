class CreateIncidentFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_files do |t|
    	t.timestamps
    	
      t.references :incident, foreign_key: true
      t.attachment :document
    end
  end
end
