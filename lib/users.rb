require 'rest_client'
require 'json'

class Users
  attr_reader :response, :json_response

  def initialize
    @response = RestClient.get 'https://driftrock-dev-test.herokuapp.com/users'
    @json_response = JSON.parse(response.body)
  end
end
