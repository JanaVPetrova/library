class ReadingEditType < Reading
  include ApplicationType

  permit :user_id, :book_id, :state_event
end
