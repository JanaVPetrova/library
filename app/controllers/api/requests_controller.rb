class Api::RequestsController < Api::ApplicationController
  def create
    request = RequestEditType.new params[:request].merge({ user_id: current_user.id })
    request.save

    respond_with request, location: nil
  end

  def update
    request = Request.find params[:id]
    request = request.becomes RequestEditType

    request.update params[:request]

    respond_with request, location: nil
  end

  def destroy
    request = Request.find params[:id]
    request.mark_as_deleted!

    respond_with request, location: nil
  end
end
