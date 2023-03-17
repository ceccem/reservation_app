class Reservation < ApplicationRecord

    belongs_to :room, class_name: "Room", foreign_key: "room_id", optional: true
    belongs_to :room, class_name: "User", foreign_key: "user_id", optional: true

    validates :check_in, presence: true
    validates :check_out, presence:true
    validates :person, presence: true
    validate :start_end_check

    def start_end_check
        if self.check_in.nil? || self.check_out.nil?
            errors.add(:check_in, :check_out)
        elsif self.check_in >= self.check_out
            errors.add(:check_out)
        end
    end
end
