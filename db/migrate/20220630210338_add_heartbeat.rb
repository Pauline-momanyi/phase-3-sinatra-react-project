class AddHeartbeat < ActiveRecord::Migration[6.1]
  def change
    add_column :patient_details, :heartrate, :integer
  end
end
