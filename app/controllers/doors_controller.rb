class DoorsController < ApplicationController
  def index
    vehicle_security_info = GMApiClient.get_security_status(params[:vehicle_id])
    if vehicle_security_info['status'] == '200'
      render json: VehicleInfoPresenter.new.format_vehicle_security_info(vehicle_security_info)
    else
      render json: {}, status: 404
    end
  end
end
