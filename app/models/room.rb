class Room < ApplicationRecord

    has_many :reservations, class_name: "Room", foreign_key: "room_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id", optional: true

    validates :name, presence: true
    validates :detail, presence: true
    validates :price, presence: true
    validates :address, presence: true

    mount_uploader :image, ImageUploader

end
