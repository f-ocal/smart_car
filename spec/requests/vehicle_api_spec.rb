require 'rails_helper'

describe 'vehicle api', type: :request do
  #TODO: integration tests for making request to smart car api and return formatted response
  it 'requests vehicle information' do
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

  describe 'returning vehicle fuel and battery status' do
    it 'requests vehicle fuel status' do
      get '/vehicles/1234/fuel'
      expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
    end

    it 'requests vehicle battery status' do
      get '/vehicles/1235/battery'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
    end
  end

  describe 'starting and stopping the vehicle' do
    it 'requests to start the vehicle' do
      params = { "action" => "START" }
      headers = { "CONTENT_TYPE" => "application/json" }
      expect(GMApiClient).to receive(:start_stop_engine).with('1234', 'START').and_call_original
      post '/vehicles/1234/engine', params: params.to_json, headers: headers
      expect(JSON.parse(response.body)['status']).to be_in(["success", "error"])
    end

    it 'requests to stop the vehicle' do
      params = { "action" => "STOP" }
      headers = { "CONTENT_TYPE" => "application/json" }
      expect(GMApiClient).to receive(:start_stop_engine).with('1234', 'STOP').and_call_original
      post '/vehicles/1234/engine', params: params.to_json, headers: headers
      expect(JSON.parse(response.body)['status']).to be_in(["success", "error"])
    end
  end
end
