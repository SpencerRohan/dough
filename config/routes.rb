Rails.application.routes.draw do
  get '/' => 'companies#form'
  post '/companies' => 'companies#search'
  get '/companies' => 'companies#index'
  get '/companies/:id' => 'companies#show'

end
