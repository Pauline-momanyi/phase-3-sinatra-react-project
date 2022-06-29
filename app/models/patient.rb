class Patient < ActiveRecord::Base 
    belongs_to :nurse
    has_many :patient_details
    has_secure_password 

end