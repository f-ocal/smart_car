class VehicleInfoPresenter
  def format_vehicle_info(vehicle_info)
    result = {}
    result['vin'] = vehicle_info['data']['vin']['value']
    result['color'] = vehicle_info['data']['color']['value']
    result['doorCount'] = if vehicle_info['data']['fourDoorSedan']['value'] == 'True'
                            4
                          else
                            2
                          end
    result['driveTrain'] = vehicle_info['data']['driveTrain']['value']

    result
  end

  def format_vehicle_security_info(vehicle_security_info)
    location_locked_info = vehicle_security_info['data']['doors']['values']

    result = location_locked_info.map do |location_locked|
      {
        location: location_locked['location']['value'],
        locked: location_locked['locked']['value'] == 'True'
      }
    end

    result
  end

  def format_vehicle_fuel_info(vehicle_fuel_info)
    fuel_information = vehicle_fuel_info['data']['tankLevel']['value']

    {
      percent: fuel_information.to_i
    }
  end

  def format_vehicle_battery_info(vehicle_fuel_info)
    battery_information = vehicle_fuel_info['data']['batteryLevel']['value']

    {
      percent: battery_information.to_i
    }
  end

  def format_start_engine_info(vehicle_engine_info)

    {
      status: vehicle_engine_info['actionResult']['status'] == 'EXECUTED' ? 'success' : 'error'
    }
  end
end
