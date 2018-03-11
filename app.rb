require_relative './lib/data_analysis'

command = ARGV

data_analysis = DataAnalysis.new

case command[0]

when "most_sold"
  p data_analysis.most_sold
when "total_spend"
  p data_analysis.total_spend(command[1])
when "most_loyal"
  p data_analysis.most_loyal
else
  p "Please choose one of the following options:"
  p "1) most_sold"
  p "2) total_spend email"
  p "3) most_loyal"
end
