class SendPayslipWorker
  include Sidekiq::Worker

  def perform(id)
    PayslipMailer.payslip_send(id).deliver_now
  end
end
