class BookEditType < Book
  include ApplicationType

  permit :title, :description, :image
end