class Patients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :age 
      t.string :sex
      t.integer :doctor_id
      t.timestamps
    end
  end
end
