class EngineController < ApplicationController
  def create
    start_stop_engine_status = GMApiClient.start_stop_engine(params[:vehicle_id], params[:engine][:action])
    if start_stop_engine_status['status'] == '200'
      render json: VehicleInfoPresenter.new.format_start_engine_info(start_stop_engine_status)
    else
      render json: {}, status: 400
    end
  end
  
  def index
    render json: "No information found!"
  end
end
