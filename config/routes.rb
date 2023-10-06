Rails.application.routes.draw do
  devise_for :users
  resources :visitantes
  resources :usuarios
  resources :setores
  resources :funcionarios

  # Outras rotas e configurações...

  get 'visitantes/consultar', to: 'visitantes#consultar'
  
end
