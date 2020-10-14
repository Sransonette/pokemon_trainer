class Pokemon < ActiveRecord::Base
    belongs_to :belt
    validates_the_presence_of :name, :belt

    
end