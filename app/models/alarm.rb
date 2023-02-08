class Alarm < ApplicationRecord
    belongs_to :user

    validates :user_id, uniqueness: {scope: [:alarm_name, :alarm_before]}
    validates :alarm_increment, numericality: {less_than_or_equal_to: 20, greater_than: 0}
end
