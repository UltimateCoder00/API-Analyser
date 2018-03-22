require 'data_analysis'

describe DataAnalysis do
  let(:purchase) {double json_response: {"data"=>[{"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Incredible Iron Pants", "spend"=>"84.93"},
                                                  {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Incredible Granite Hat", "spend"=>"76.89"},
                                                  {"user_id"=>"S27G-8UMJ-LDSL-UOPN", "item"=>"Durable Concrete Hat", "spend"=>"15.31"}
                                                  ]}}
  let(:user) {double json_response: {"data"=>[{"id"=>"KZHR-1H35-2IH8-JXYN", "first_name"=>"Quincy", "last_name"=>"Schimmel", "phone"=>"186.301.6921 x948", "email"=>"schimmel_quincy@ernser.io"},
                                              {"id"=>"S27G-8UMJ-LDSL-UOPN", "first_name"=>"Henry", "last_name"=>"Terry", "phone"=>"636-387-6074 x690", "email"=>"terry_henry@doyle.io"}]}}

  subject(:data_analysis) {described_class.new(user, purchase)}

  describe '#users' do
    it 'Contains array of users data' do
      expect(data_analysis.users.class).to eq Array
    end
  end

  describe '#purchases' do
    it 'Contains array of purchases data' do
      expect(data_analysis.purchases.class).to eq Array
    end
  end

  describe '#most_sold' do
    it 'Returns most sold item' do
      most_sold_item = "Incredible Iron Pants"
      expect(data_analysis.most_sold).to eq most_sold_item
    end
  end

  describe '#most_loyal' do
    it 'Returns most loyal customer' do
      most_sold_loyal_customer = "schimmel_quincy@ernser.io"
      expect(data_analysis.most_loyal).to eq most_sold_loyal_customer
    end

    describe 'When there are equal most loyal users' do
      let(:purchase) {double json_response: {"data"=>[{"user_id"=>"S27G-8UMJ-LDSL-UOPN", "item"=>"Durable Concrete Hat", "spend"=>"15.31"},
                                                      {"user_id"=>"S27G-8UMJ-LDSL-UOPN", "item"=>"Fantastic Steel Bottle", "spend"=>"5.64"},
                                                      {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Incredible Iron Pants", "spend"=>"84.93"},
                                                      {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Incredible Granite Hat", "spend"=>"76.89"}
                                                      ]}}
      let(:user) {double json_response: {"data"=>[{"id"=>"KZHR-1H35-2IH8-JXYN", "first_name"=>"Quincy", "last_name"=>"Schimmel", "phone"=>"186.301.6921 x948", "email"=>"schimmel_quincy@ernser.io"},
                                                  {"id"=>"S27G-8UMJ-LDSL-UOPN", "first_name"=>"Henry", "last_name"=>"Terry", "phone"=>"636-387-6074 x690", "email"=>"terry_henry@doyle.io"}]}}

      it 'Returns first most loyal user' do
        most_sold_loyal_customer = "terry_henry@doyle.io"
        expect(data_analysis.most_loyal).to eq most_sold_loyal_customer
      end
    end
  end

  describe '#total_spend(email)' do
    it 'Returns total spend of customer' do
      email = "terry_henry@doyle.io"
      total_spend = 15.31
      expect(data_analysis.total_spend(email)).to eq total_spend
    end

    it 'Error message for incorrect email' do
      email = "abcdef1243231432@eagjoasgnsadgn.com"
      error_message = "The email does not exist"
      expect{data_analysis.total_spend(email)}.to raise_error error_message
    end
  end
end
