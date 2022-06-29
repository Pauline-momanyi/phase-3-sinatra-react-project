class Nurse < ActiveRecord::Base 
    has_many :patients
    has_many :patient_details
    has_secure_password 

end