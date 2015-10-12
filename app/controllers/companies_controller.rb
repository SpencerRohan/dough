class CompaniesController < ApplicationController

  def form

  end

  def search
   symbols_query = Company.where("LOWER(symbol) LIKE ?", "%#{params[:query].downcase}%")
   names_query = Company.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
   @results = (symbols_query + names_query).uniq
    render :"companies/index"
  end

  def index #show results

  end

  def show #show graph

  end

end