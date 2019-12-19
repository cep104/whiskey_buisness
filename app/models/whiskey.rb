class Whiskey < ActiveRecord::Base 
    belongs_to :user
    belongs_to :distillery
end