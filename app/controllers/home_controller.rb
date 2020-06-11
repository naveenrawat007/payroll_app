class HomeController < ApplicationController
  require 'roo'

  def index
  end

  def excel_data
    sheet = Roo::Excelx.new(params[:file].path)
    (3..sheet.last_row).each do |i|
      payroll = Payrol.find_or_create_by(month: sheet.row(i)[0])
      employee = Employee.find_or_create_by(emp_id: sheet.row(i)[2])
      employee.update()
    end
  end



end
