  class GMApiClient
    include HTTParty
    base_uri 'http://gmapi.azurewebsites.net'

    def self.get_vehicle_info(id)
      post('/getVehicleInfoService',
           body: { id: id, responseType: 'JSON' }.to_json,
           headers: { 'Content-Type' => 'application/json' }
          ).body
    end
  end
