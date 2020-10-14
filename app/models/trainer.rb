class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :belts
    has_many :pokemon, :through => :belts
    validates_uniqueness_of :username
    
end
