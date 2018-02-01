class FuelController < ApplicationController
  def index
    vehicle_fuel_info = GMApiClient.get_fuel_and_battery_status(params[:vehicle_id])
    if vehicle_fuel_info['status'] == '200'
      render json: VehicleInfoPresenter.new.format_vehicle_fuel_info(vehicle_fuel_info)
    else
      render json: {}, status: 404
    end
  end
end
