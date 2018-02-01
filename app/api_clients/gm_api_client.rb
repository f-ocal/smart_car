class GMApiClient
  include HTTParty
  base_uri 'http://gmapi.azurewebsites.net'

  def self.get_vehicle_info(id)
    response = post('/getVehicleInfoService',
                    body: { id: id, responseType: 'JSON' }.to_json,
                    headers: { 'Content-Type' => 'application/json' }
                   ).body

    JSON.parse(response)
  end

  def self.get_security_status(id)
    response = post('/getSecurityStatusService',
                    body: { id: id, responseType: 'JSON' }.to_json,
                    headers: { 'Content-Type' => 'application/json' }
                   ).body

    JSON.parse(response)
  end

  def self.get_fuel_and_battery_status(id)
    response = post('/getEnergyService',
                    body: { id: id, responseType: 'JSON' }.to_json,
                    headers: { 'Content-Type' => 'application/json' }
                   ).body

    JSON.parse(response)
  end
end
