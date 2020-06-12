Rails.application.routes.draw do
  root "payrol#index"
  post '/import_data' => "payrol#generate_data"
  get '/show' => 'payrol#show'
  get '/download_slip/:id' => "payrol#download_slip"
end
