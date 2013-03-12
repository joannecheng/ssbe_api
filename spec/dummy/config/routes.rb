Rails.application.routes.draw do
  resource :clients
  mount SsbeApi::Engine => "/ssbe_api"
end
