Rails.application.routes.draw do
  resources :posts

  scope '/api' do
    post '/users/:id/unfollow' => 'users#follow'
    get '/all' => 'users#all'
    post '/signup'=> 'users#create'
    post '/login' => 'users#signin'
    resources :posts
    resources :users do
      collection do
        get :my_posts
      end
       member do
         post :follow
       end
    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
