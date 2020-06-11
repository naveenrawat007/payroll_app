Rails.application.routes.draw do
  root "home#index"
  post '/import_data' => "home#excel_data"
end
