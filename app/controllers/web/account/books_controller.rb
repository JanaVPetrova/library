class Web::Account::BooksController < Web::Account::ApplicationController
  def show
    @book = Book.find params[:id]
  end

  def index
    @books = Book.all
  end

  def new
    @book = BookEditType.new
  end

  def create
    @book = BookEditType.new params[:book]
    @book.user = current_user
    if @book.save
      redirect_to account_books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    @book = @book.becomes BookEditType

    if @book.update params[:book]
      redirect_to [:account, @book]
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy

    redirect_to account_books_path
  end
end
