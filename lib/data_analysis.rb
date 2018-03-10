require_relative 'users'
require_relative 'purchases'

class DataAnalysis
  attr_reader :users, :purchases

  def initialize(users = Users.new, purchases=Purchases.new)
    @users = users
    @purchases = purchases
  end

  def most_sold
    items_sold = {}
    purchases.json_response["data"].each do |data|
      items_sold.include?(data["item"]) ? items_sold[data["item"]] += 1 : items_sold[data["item"]] = 1
    end
    items_sold.sort_by { |key, val| val }.last.first
  end
end
