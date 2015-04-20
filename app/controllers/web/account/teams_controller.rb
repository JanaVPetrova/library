class Web::Account::TeamsController < Web::Account::ApplicationController
  def show
    @team = current_user.team
  end

  def edit
    @team = current_user.team
  end

  def update
    @team = current_user.team
    @team = @team.becomes TeamEditType

    if @team.update params[:team]
      redirect_to [:account, @team]
    else
      render :edit
    end
  end

  def destroy
    @team = current_user.team
    @team.destroy

    redirect_to account_team_path
  end
end
