Rails.application.routes.draw do
  resources :clients
  mount SsbeApi::Engine => "/ssbe_api"
end
