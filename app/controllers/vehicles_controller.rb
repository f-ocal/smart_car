class VehiclesController < ApplicationController

  def show
    vehicle_info = GMApiClient.get_vehicle_info(params[:id])
    if vehicle_info['status'] == '200'
      render json: VehicleInfoPresenter.new.format_vehicle_info(vehicle_info)
    else
      render json: {}, status: 404
    end
  end
end
