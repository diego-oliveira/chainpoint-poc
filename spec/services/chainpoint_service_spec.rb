require 'rails_helper'

RSpec.describe "ChainpointService", type: :model do
  describe 'submit' do
    before do
      successful_response_body = {
        "meta": {
          "hash_received": "2021-08-28T21:13:58Z",
          "processing_hints": {
            "cal": "2021-08-28T21:16:00Z",
            "btc": "2021-08-28T23:13:58Z"
          }
        },
        "hashes": [
          {
            "proof_id": "dc40df00-0844-11ec-8ef4-01624f28a383",
            "hash": "0c6cf25d11e4ca0cbf06b11d671f5d7ca6819369"
          }
        ]
      }.to_json

      stub_request(:post, /#{ENV['CHAINPOINT_URL']}/).
        to_return(body: successful_response_body, status: 200)
    end

    describe 'when successful submit' do
      it 'returns the chainpoint response' do
        response = ChainpointService.submit('0c6cf25d11e4ca0cbf06b11d671f5d7ca6819369')
        expect(response['hashes'][0]['hash']).to eq('0c6cf25d11e4ca0cbf06b11d671f5d7ca6819369')
      end
    end

    describe 'when submit invalid hash' do
      before do
        error_response_body = {
          "code": "InvalidArgument",
          "message": "invalid JSON body, invalid hashes present"
        }.to_json

        stub_request(:post, /3.136.178.15/).
          to_return(body: error_response_body, status: 400)
      end

      it 'raises an exception' do
        expect { ChainpointService.submit('invalid_hash') }.to raise_error(Error::BusinessError)
      end
    end
  end
end
