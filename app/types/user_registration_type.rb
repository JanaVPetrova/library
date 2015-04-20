class UserRegistrationType < User
  include ApplicationType

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, email: true

  permit :email, :password, :password_confirmation, :last_name, :first_name, :photo
end
