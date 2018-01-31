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
end
