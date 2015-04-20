class Web::Account::ReadingsController < Web::Account::ApplicationController
  def index
    @readings = current_user.readings
  end
end
