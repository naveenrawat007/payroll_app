class Payrol < ApplicationRecord
  has_many :salary_details, dependent: :destroy
end
