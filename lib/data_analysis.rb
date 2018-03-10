require_relative 'users'
require_relative 'purchases'

class DataAnalysis
  attr_reader :users, :purchases

  def initialize(users = Users.new, purchases=Purchases.new)
    @users = users
    @purchases = purchases
  end
end
