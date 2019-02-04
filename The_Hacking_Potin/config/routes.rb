# frozen_string_literal: true

Rails.application.routes.draw do
  get '/user/:id', to: 'user#home'
  get '/contact', to: 'contact#home'
  get '/team', to: 'team#home'
  get '/', to: 'index#home' do 
  	erb :index, locals: {gossip: Gossip.all}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
