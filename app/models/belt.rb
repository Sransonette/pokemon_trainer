class Belt < ActiveRecord::Base
    belongs_to :trainer
    has_many :pokemon
    validates_presence_of :name, :trainer
    
end