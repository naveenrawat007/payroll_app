class PayslipMailer < ApplicationMailer

  def payslip_send(id)
    payslip = SalaryDetail.includes(:employee).includes(:payrol).find_by(id: id)
    email = "naveenrawat808@gmail.com"
    kit = PDFKit.new(as_html(payslip), page_size: 'A4')
    attachments['payslip.pdf'] = File.read(kit.to_file("#{Rails.root}/public/payslip.pdf"))
    mail(to:email, subject: "Pay Slip")
  end

  def as_html(payslip)
    render template: "payrol/download_slip",layout: "payslip_pdf", locals: { payslip: payslip }
  end

end
