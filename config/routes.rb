Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new'
  root 'static_pages#home'
  get '/help',     to:    'static_pages#help', as: 'helf' # helf_path
  get '/about',    to:    'static_pages#about'
  get '/contact',  to:    'static_pages#contact'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  post 'login_post', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
