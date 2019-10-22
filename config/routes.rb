Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources(:users)
  resources(:songs)
  resources(:reviews)
  post('/login', to: 'authentication#login')
  # post('logout', to: 'authentication#logut')
end
