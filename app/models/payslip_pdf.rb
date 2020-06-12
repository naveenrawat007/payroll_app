require "render_anywhere"

class PayslipPdf
  include RenderAnywhere

  def initialize(payslip)
    @payslip = payslip
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/payslip.pdf")
  end

  def filename
    "Payslip #{payslip.id}.pdf"
  end

  private

    attr_reader :payslip

    def as_html
      render template: "payrol/download_slip",layout: "payslip_pdf", locals: { payslip: payslip }
    end
end
