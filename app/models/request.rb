class Request < ActiveRecord::Base
  include Workflow

  belongs_to :user
  belongs_to :book

  workflow do
    state :pending do
      event :confirm, transitions_to: :confirmed
    end

    state :confirmed do
      event :return, transitions_to: :returned
    end

    state :returned
  end

  scope :incoming_for, -> user { where(book_id: user.books) }
end
