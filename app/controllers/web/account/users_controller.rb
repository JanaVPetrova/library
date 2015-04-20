class Web::Account::UsersController < Web::Account::ApplicationController
  def show
    @user = current_user
  end
end
