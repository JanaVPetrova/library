class Web::TeamsController < Web::ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = TeamEditType.new params[:team]

    if @team.valid?
      @team.save
      @team.users << current_user
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.find params[:id]
  end
end
