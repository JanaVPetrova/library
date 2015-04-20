module BooksHelper
  def current_users_book?(book)
    return unless current_user

    current_user.books.include?(book)
  end
end
