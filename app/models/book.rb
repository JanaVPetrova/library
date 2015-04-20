class Book < ActiveRecord::Base
  acts_as_paranoid

  has_many :requests
  has_many :readings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader
end
