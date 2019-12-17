class Whiskey < ActiveRecord::Base 
    belongs_to :user
    has_many :whiskey_distilleries
    has_many :distilleries, through: :whiskey_distilleries
end