class PayrolController < ApplicationController
  require 'roo'

  def index
  end

  def generate_data
    sheet = Roo::Excelx.new(params[:file].path)
    SaveExcelData.new(sheet).call
    redirect_to show_path
    flash[:success] = "Nice Your Excel Sheet data is saved Sucessfully !!"
  end

  def show
    @salary_details = SalaryDetail.includes(:employee).includes(:payrol)
  end

  def download_slip
    download_pdf
  end

  def mail_payslip
    # Sidekiq::Client.enqueue_to_in("default",Time.now, SendPayslipWorker,params[:id])
    PayslipMailer.payslip_send(params[:id]).deliver_now
    redirect_to show_path
    flash[:success] = "Pay Slip send to your email. Thank You !!"
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
