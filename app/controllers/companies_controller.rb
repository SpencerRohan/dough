class CompaniesController < ApplicationController

  def search
   symbols_query = Company.where("LOWER(symbol) LIKE ?", "%#{params[:query].downcase}%")
   names_query = Company.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
   results = (symbols_query + names_query).uniq
   @results = results.sort { |a, b| a.name <=> b.name }.first(20)
    render :"companies/index"
  end

  def index
    @companies = Company.all.sample(20)
  end

  def show
    @company = Company.find(params[:id])
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.historical_quotes(@company.symbol, { start_date: Time::now-(24*60*60*30), end_date: Time::now })
    @daily_average = data.map do |day|
      [day.low.to_f, day.high.to_f, day.open.to_f, day.close.to_f].reduce(:+)/4.0
    end.reverse
    range = [0, @daily_average.max, @daily_average.max/100]
    @graph = Gchart.line( title: @company.name,
                          data: @daily_average,
                          min_value: @daily_average.min,
                          max_value: @daily_average.max,
                          axis_with_labels: ['x', 'y'],
                          axis_range: [[1,11,21,30], range],
                          axis_labels: [[data[-1].trade_date, data[data.count/2].trade_date, 'Today']])


  end

end