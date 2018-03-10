require 'data_analysis'

describe DataAnalysis do
  subject(:data_analysis) {described_class.new}

  describe '#users' do
    it 'Contains Users class' do
      expect(data_analysis.users.class).to eq Users
    end
  end

  describe '#purchases' do
    it 'Contains Purchases class' do
      expect(data_analysis.purchases.class).to eq Purchases
    end
  end

  describe '#most_sold' do
    it 'Returns most sold item' do
      most_sold_item = "Heavy Duty Concrete Watch"
      expect(data_analysis.most_sold).to eq most_sold_item
    end
  end

  describe '#most_loyal' do
    it 'Returns most loyal customer' do
      most_sold_loyal_customer = "travis_kshlerin@wunsch.net"
      expect(data_analysis.most_loyal).to eq most_sold_loyal_customer
    end
  end
end
