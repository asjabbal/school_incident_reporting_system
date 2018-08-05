class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
    	t.timestamps

      t.references :incident, foreign_key: true
      t.string :name
      t.string :contact_info
      t.integer :role
    end
  end
end
