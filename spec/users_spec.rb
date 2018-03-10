require 'users'

describe Users do
  subject(:users) {described_class.new}

  json_hash_content = {"id"=>"KZHR-1H35-2IH8-JXYN", "first_name"=>"Quincy", "last_name"=>"Schimmel", "phone"=>"186.301.6921 x948", "email"=>"schimmel_quincy@ernser.io"}

  describe '#response' do
    it 'Contains RestClient::Response class' do
      expect(users.response.class).to eq RestClient::Response
    end
  end

  describe '#json_response' do
    it 'Has JSON hash content' do
      expect(users.json_response["data"][0]).to eq json_hash_content
    end
  end
end
