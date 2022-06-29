class PatientDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_details do |t|
      t.integer :patient_id
      t.integer :temperature
      t.string :pressure
      t.string :SPO2      
      t.string :Doctor_Remarks
      t.timestamps
    end
  end
end
