class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user, foreign_key: true, optional: true
end
