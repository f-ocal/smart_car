require 'rails_helper'

describe 'vehicle api', type: :request do
  it 'makes a request to GM and formats the response' do
    get '/vehicles/1234'
    expect(response.body).to eq(
      {
        vin: '123123412412',
        color: 'Metallic Silver',
        doorCount: 4,
        driveTrain: 'v8'
      }.to_json
    )
  end

  it 'handles empty response from GM' do
    get '/vehicles/0'
    expect(response.status).to eq 404
  end

  it 'requests vehicle security status' do
    get '/vehicles/1234/doors'
    expect(JSON.parse(response.body).first['location']).to be_kind_of(String)
    expect(JSON.parse(response.body).first['locked']).to be_in([true, false])
  end
end
