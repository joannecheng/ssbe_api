SsbeApi::Engine.routes.draw do
  resources :docs

  root :to => 'docs#index'
end
