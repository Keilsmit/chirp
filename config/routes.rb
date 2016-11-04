Rails.application.routes.draw do
  resources :posts

  scope '/api' do
    resources :users
    post '/login' => 'users#signin'
    post '/signup'=> 'users#create'
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
