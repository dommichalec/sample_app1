Rails.application.routes.draw do
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#help'
  root 'application#hello'
end
