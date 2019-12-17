class User < ActiveRecord::Base  
    has_secure_password 
    has_many :whiskeys
    has_many :distilleries, through: :whiskeys
end