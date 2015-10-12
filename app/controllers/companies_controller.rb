class CompaniesController < ApplicationController

  def search
   symbols_query = Company.where("LOWER(symbol) LIKE ?", "%#{params[:query].downcase}%")
   names_query = Company.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
   results = (symbols_query + names_query).uniq
   @results = results.sort { |a, b| a.name <=> b.name }.first(20)
    render :"companies/index"
  end

  def index

  end

  def show #show graph

  end

end