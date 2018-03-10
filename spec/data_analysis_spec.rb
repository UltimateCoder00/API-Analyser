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
end
