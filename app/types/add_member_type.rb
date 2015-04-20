class AddMemberType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String

  validates :email, presence: true,
                    email: true
  validate :check_existance

  def user
    User.find_by(email: email)
  end

  private
  def check_existance
    unless user
      errors.add(:email, :user_doesnt_exist)
    end
  end
end
