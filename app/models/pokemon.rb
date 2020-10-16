class Pokemon < ActiveRecord::Base
    belongs_to :trainer
    validates_presence_of :name, :trainer, :pokemon_type

    
end