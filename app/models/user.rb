class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true


  mount_uploader :image, ImageUploader
  has_many :rooms, class_name: "Room", foreign_key: "user_id"
  has_many :reservations, class_name: "Reservation", foreign_key: "user_id"
end
