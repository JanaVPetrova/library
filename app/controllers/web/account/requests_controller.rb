class Web::Account::RequestsController < Web::Account::ApplicationController
  def index
    @requests = Request.incoming_for(current_user)
  end
end
