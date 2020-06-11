class Employee < ApplicationRecord
  belongs_to :company, optional: true
  has_many :salary_details, dependent: :destroy
end
