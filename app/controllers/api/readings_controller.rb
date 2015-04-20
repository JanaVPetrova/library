class Api::ReadingsController < Api::ApplicationController
  def create
    reading = ReadingEditType.new params[:reading].merge({ user_id: current_user.id })
    reading.save

    respond_with reading, location: nil
  end

  def update
    reading = Reading.find params[:id]
    reading = reading.becomes ReadingEditType

    reading.update params[:reading]

    respond_with reading, location: nil
  end
end
