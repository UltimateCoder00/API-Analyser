require 'rest_client'
require 'json'
require 'envyable'
Envyable.load('config/env.yml')

class Purchases
  attr_reader :response, :json_response

  def initialize
    @response = RestClient.get ENV["PURCHASE_DATA_ENDPOINT"]
    @json_response = JSON.parse(response.body)
  end
end
