require 'data_analysis'

describe DataAnalysis do
  subject(:data_analysis) {described_class.new}

  describe '#users' do
    it 'Contains Users class' do
      expect(data_analysis.users.class).to eq Array
    end
  end

  describe '#purchases' do
    it 'Contains Purchases class' do
      expect(data_analysis.purchases.class).to eq Array
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

  describe '#total_spend(email)' do
    it 'Returns total spend of customer' do
      email = "travis_kshlerin@wunsch.net"
      total_spend = 336.76
      expect(data_analysis.total_spend(email)).to eq total_spend

      email = "eliseo.zieme@bosco.info"
      total_spend = 49.77
      expect(data_analysis.total_spend(email)).to eq total_spend

      email = "pearlie.yost@greenholt.biz"
      total_spend = 303.06
      expect(data_analysis.total_spend(email)).to eq total_spend
    end

    it 'Error message for incorrect email' do
      email = "abcdef1243231432@eagjoasgnsadgn.com"
      error_message = "The email does not exist"
      expect{data_analysis.total_spend(email)}.to raise_error error_message
    end
  end
end
