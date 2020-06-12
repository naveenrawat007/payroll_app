class PayrolController < ApplicationController
  require 'roo'

  def index
  end

  def generate_data
    sheet = Roo::Excelx.new(params[:file].path)
    (3..sheet.last_row).each do |i|
      payroll = Payrol.find_or_create_by(month: sheet.row(i)[0])
      employee = Employee.find_or_create_by(emp_id: sheet.row(i)[2])
      employee.update(name:sheet.row(i)[1], designation: sheet.row(i)[3], department: sheet.row(i)[4], account_no: sheet.row(i)[6], pf_no: sheet.row(i)[8], pan_no: sheet.row(i)[7], payment_by: sheet.row(i)[5])
      salary_detail = employee.salary_details.find_or_create_by(payrol_id: payroll.id)
      salary_detail.update( working_days: sheet.row(i)[9], pf: sheet.row(i)[10], basic: sheet.row(i)[11], hra: sheet.row(i)[12], incentives: sheet.row(i)[13], lic: sheet.row(i)[15], total_earning: sheet.row(i)[16], pf_deduction: sheet.row(i)[17], esi_deduction: sheet.row(i)[18], pt_deduction: sheet.row(i)[19], tds_deduction: sheet.row(i)[20], total_deduction: sheet.row(i)[21], total_paid_amount: sheet.row(i)[22])
    end
    redirect_to show_path
  end

  def show
    @salary_details = SalaryDetail.includes(:employee).includes(:payrol)
  end

  def download_slip
    download_pdf
  end

  def mail_payslip
    Sidekiq::Client.enqueue_to_in("default",Time.now, SendPayslipWorker,params[:id])
  end

  private

  def payslip_pdf
    @salary_detail = SalaryDetail.includes(:employee).includes(:payrol).find_by(id: params[:id])
    PayslipPdf.new(@salary_detail)
  end

  def download_pdf
    send_file( payslip_pdf.to_pdf,filename: payslip_pdf.filename, type: "application/pdf", :disposition => 'attachment', :url_based_filename => false )
  end


end
