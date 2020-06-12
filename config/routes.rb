Rails.application.routes.draw do
  root "payrol#index"
  post '/import_data' => "payrol#generate_data"
  get '/show' => 'payrol#show'
  post '/download_slip/:id' => "payrol#download_slip"
  post '/mail_pay_slip/:id' => "payrol#mail_payslip"
end
