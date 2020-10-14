class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :pokemon
    validates_uniqueness_of :username
    
end
