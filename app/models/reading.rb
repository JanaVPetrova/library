class Reading < ActiveRecord::Base
  include Workflow

  belongs_to :book
  belongs_to :user

  scope :by_month, -> { where(updated_at: Time.current.month, workflow_state: :finished) }

  workflow do
    state :in_progress do
      event :finish, transitions_to: :finished
    end

    state :finished
  end
end
