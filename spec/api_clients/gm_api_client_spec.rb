require 'rails_helper'

describe GMApiClient do
  it 'makes a get to the GM api' do
    id = 1234
    response = GMApiClient.get_vehicle_info(id)

    expect(response).to eq %({"service":"getVehicleInfo","status":"200","data":{"vin":{"type":"String","value":"123123412412"},"color":{"type":"String","value":"Metallic Silver"},"fourDoorSedan":{"type":"Boolean","value":"True"},"twoDoorCoupe":{"type":"Boolean","value":"False"},"driveTrain":{"type":"String","value":"v8"}}})
  end

end
