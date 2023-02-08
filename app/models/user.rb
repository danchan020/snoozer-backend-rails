class User < ApplicationRecord
    has_secure_password
    has_many :alarms

    attr_accessor :old_password
    
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
    validates_length_of :username, :maximum => 15
end
