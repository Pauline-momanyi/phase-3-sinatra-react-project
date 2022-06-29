class AddCol < ActiveRecord::Migration[6.1]
  def change
    add_column :patient_details, :doctor_id, :integer
  end
end
