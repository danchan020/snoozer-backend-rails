class User < ApplicationRecord
    has_secure_password
    has_many :alarms
    
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
    validates_length_of :username, :max_length => 15
end
