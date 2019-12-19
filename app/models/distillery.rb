class Distillery < ActiveRecord::Base 
    has_many :whiskeys
    belongs_to :user
    
  
end