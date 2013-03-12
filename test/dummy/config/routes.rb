Rails.application.routes.draw do

  mount SsbeApi::Engine => "/ssbe_api"
end
