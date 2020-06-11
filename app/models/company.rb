class Company < ApplicationRecord
  has_many :payrols
  has_many :employees
end
