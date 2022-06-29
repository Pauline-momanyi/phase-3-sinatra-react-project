class User < ActiveRecord::Base 
    has_secure_password 
    #from active record, add salt to the password
    
    validates :email, presence: true 
    validates :email, uniqueness: true 

    has_many :grievances
    
end