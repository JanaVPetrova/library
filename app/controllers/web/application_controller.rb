class Web::ApplicationController < ApplicationController
  include BooksHelper
  respond_to :html

  helper_method :current_users_book?
end
