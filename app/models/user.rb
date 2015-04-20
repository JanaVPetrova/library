class User < ActiveRecord::Base
  has_secure_password
  has_many :requests
  has_many :books
  has_many :readings
  belongs_to :team

  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    email: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  mount_uploader :photo, ImageUploader
end
