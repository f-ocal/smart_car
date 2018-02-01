require 'rails_helper'

describe GMApiClient do
  it 'gets vehicle info' do
    #TODO: this test hits the gm api and expects a specific response. Rewrite test to not expect exact response
    id = 1234
    response = GMApiClient.get_vehicle_info(id)

    expected_response = {
      "service"=>"getVehicleInfo",
      "status"=>"200",
      "data"=>{
        "vin"=>{
          "type"=>"String",
          "value"=>"123123412412"
        },
        "color"=>{
          "type"=>"String",
          "value"=>"Metallic Silver"
        },
        "fourDoorSedan"=>{
          "type"=>"Boolean",
          "value"=>"True"
        },
        "twoDoorCoupe"=>{
          "type"=>"Boolean",
          "value"=>"False"
        },
        "driveTrain"=>{
          "type"=>"String",
          "value"=>"v8"
        }
      }
    }
    expect(response).to eq expected_response

  end

  it 'gets vehicle security status' do
    id = 1234
    response = GMApiClient.get_security_status(id)

    expected_locations = ['backRight', 'frontRight', 'backLeft', 'frontLeft']
    expect(expected_locations).to include response['data']['doors']['values'].first['location']['value']
    expect(['True', 'False']).to include response['data']['doors']['values'].first['locked']['value']
  end

end
