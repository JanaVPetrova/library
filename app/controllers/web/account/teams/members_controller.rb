class Web::Account::Teams::MembersController < Web::Account::Teams::ApplicationController
  def index
    @members = resourse_team.users
  end

  def new
    @member = AddMemberType.new
  end

  def create
    type = AddMemberType.new params[:add_member_type]
    member = type.user

    if member
      resourse_team.users << member
      redirect_to account_team_members_path
    else
      render :new
    end
  end
end
