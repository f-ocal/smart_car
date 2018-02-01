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
    locationLockInfo = vehicle_security_info['data']['doors']['values']

    result = locationLockInfo.map do |k|
      {
        location:  k['location']['value'],
        locked: k['locked']['value'] == 'True'
      }
    end
    
    result
  end
end
