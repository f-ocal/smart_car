class BatteryController < ApplicationController
  def index
    vehicle_battery_info = GMApiClient.get_fuel_and_battery_status(params[:vehicle_id])
    if vehicle_battery_info['status'] == '200'
      render json: VehicleInfoPresenter.new.format_vehicle_battery_info(vehicle_battery_info)
    else
      render json: {}, status: 404
    end
  end
end
