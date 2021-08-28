require 'rails_helper'

RSpec.describe "Api::V1::Badges", type: :request do
  describe "POST /create" do
    describe "when all required information are given" do
      let(:successful_response_body) do
        {
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
      end

      before do
        stub_request(:post, /#{ENV['CHAINPOINT_URL']}/).
          to_return(body: successful_response_body, status: 200)

        post api_v1_badge_index_path, params: { badge: { issue_date: DateTime.current,  name: Faker::Lorem.sentence(word_count: 2), uuid: Faker::Internet.uuid  }  }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:successful)
      end

      it 'returns chainpoint response' do
        response_json = JSON.parse(response.body)
        expect(response.body).to match(/#{successful_response_body}/)
      end
    end

    describe "when missing required information" do
      before do
        post api_v1_badge_index_path, params: { badge: { uuid: Faker::Internet.uuid  }  }
      end

      it 'returns 422 error' do
        expect(response).to have_http_status(422)
      end

      it 'returns the errors' do
        response_json = JSON.parse(response.body)
        expect(response_json['message']).to match(/Validation failed: Name can't be blank, Issue date can't be blank/)
      end
    end
  end
end
