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

  def most_loyal
    items_sold = {}
    purchases.json_response["data"].each do |data|
      items_sold.include?(data["user_id"]) ? items_sold[data["user_id"]] += 1 : items_sold[data["user_id"]] = 1
    end
    user_id = items_sold.sort_by { |key, val| val }.last.first

    users.json_response["data"].each do |data|
      return data["email"] if data["id"] == user_id
    end
  end

  def total_spend(email)
    total_spend = 0
    user_id = nil

    users.json_response["data"].each do |data|
      if data["email"] == email
        user_id = data["id"]
      end
    end

    purchases.json_response["data"].each do |data|
      if data["user_id"] == user_id
        total_spend += data["spend"].to_f
      end
    end
    total_spend
  end
end
