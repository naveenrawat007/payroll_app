class HomeController < ApplicationController
  require 'roo'

  def index
  end

  def excel_data
    sheet = Roo::Excelx.new(params[:file].path)
    (3..sheet.last_row).each do |i|
      payroll = Payrol.find_or_create_by(month: sheet.row(i)[0])
      employee = Employee.find_or_create_by(emp_id: sheet.row(i)[2])
      employee.update(name:sheet.row(i)[1], designation: sheet.row(i)[3], department: sheet.row(i)[4], account_no: sheet.row(i)[6], pf_no: sheet.row(i)[8], pan_no: sheet.row(i)[7], payment_by: sheet.row(i)[5])
    end
  end



end
