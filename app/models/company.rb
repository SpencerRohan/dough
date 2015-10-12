class Company < ActiveRecord::Base

  validates :name, :symbol, presence: true, uniqueness: true
end
