class PatientDetail < ActiveRecord::Base 
    belongs_to :patient
    belongs_to :nurse

end