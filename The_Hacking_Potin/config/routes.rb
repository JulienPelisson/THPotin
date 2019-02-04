Rails.application.routes.draw do
  get '/bienvenue', to: 'bienvenue#home'
  get '/contact', to: 'contact#home'
  get '/team', to: 'team#home'
  get '/', to: 'index#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
