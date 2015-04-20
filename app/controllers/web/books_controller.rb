class Web::BooksController < Web::ApplicationController
  def show
    @book = Book.find params[:id]
  end

  def index
    @books = Book.all
  end
end
