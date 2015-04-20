class Team < ActiveRecord::Base
  acts_as_paranoid

  has_many :users, dependent: :nullify

  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
