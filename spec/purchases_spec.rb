require 'purchases'

describe Purchases do
  subject(:purchases) {described_class.new}

  json_hash_content = {"user_id"=>"FFWN-1CKR-X4WU-Q44M","item"=>"Awesome Marble Clock","spend"=>"69.44"}

  describe '#response' do
    it 'Contains RestClient::Response class' do
      expect(purchases.response.class).to eq RestClient::Response
    end
  end

  describe '#json_response' do
    it 'Has JSON hash content' do
      expect(purchases.json_response["data"][0]).to eq json_hash_content
    end
  end
end
