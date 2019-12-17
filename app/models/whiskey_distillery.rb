class WhiskeyDistillery < ActiveRecord::Base
    
    belongs_to :whiskey
    belongs_to :distillery
end