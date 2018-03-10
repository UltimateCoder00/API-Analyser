require_relative 'users'
require_relative 'purchases'

class DataAnalysis
  attr_reader :users, :purchases

  def initialize(users = Users.new, purchases=Purchases.new)
    @users = users
    @purchases = purchases
  end

  def most_sold
    most_purchase_by("item")
  end

  def most_loyal
    email_of(most_purchase_by("user_id"))
  end

  def total_spend(email)
    total_spend_of(id_of(email))
  end

  private

  def most_purchase_by(key)
    items_sold = {}
    purchases.json_response["data"].each do |data|
      items_sold.include?(data[key]) ? items_sold[data[key]] += 1 : items_sold[data[key]] = 1
    end
    items_sold.sort_by { |key, val| val }.last.first
  end

  def email_of(user_id)
    find_customer_details("email", "id", user_id)
  end

  def id_of(email)
    find_customer_details("id", "email", email)
  end

  def find_customer_details(return_key, given_key, value)
    users.json_response["data"].each do |data|
      return data[return_key] if data[given_key] == value
    end
  end

  def total_spend_of(user_id)
    total_spend = 0
    purchases.json_response["data"].each do |data|
      total_spend += data["spend"].to_f if data["user_id"] == user_id
    end
    total_spend
  end
end
