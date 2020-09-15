Rails.application.routes.draw do
  get 'register/info1'
  get 'register/info2'
  get 'visitor/main'

  devise_for :users, :controllers => {omniauth_callbacks: 'user/omniauth_callbacks'}

  mount GrapeSwaggerRails::Engine => '/swagger'

  mount API::Root => '/'
end
