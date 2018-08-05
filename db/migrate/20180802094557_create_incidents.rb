class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
    	t.timestamps

      t.text :suspect_info
      t.text :witness_info
      t.datetime :occurred_at
      t.text :description
    end
  end
end
