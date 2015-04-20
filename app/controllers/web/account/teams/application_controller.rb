class Web::Account::Teams::ApplicationController < Web::Account::ApplicationController
  def resourse_team
    current_user.team
  end
end
