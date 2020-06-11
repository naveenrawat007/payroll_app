class Employee < ApplicationRecord
  belongs_to :company
  has_many :salary_details, dependent: :destroy
end
