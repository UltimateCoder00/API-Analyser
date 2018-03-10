require 'rest_client'
require 'json'

class Purchases
  attr_reader :response, :json_response

  def initialize
    @response = RestClient.get 'https://driftrock-dev-test.herokuapp.com/purchases'
    @json_response = JSON.parse(response.body)
  end
end
