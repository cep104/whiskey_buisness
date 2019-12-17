class Distillery < ActiveRecord::Base 
    has_many :whiskeys
    has_many :users, through: :whiskeys
end