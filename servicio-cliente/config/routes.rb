Rails.application.routes.draw do
  post '/turnos', to: 'turnos#create'
end
