Rails.application.routes.draw do
  resources :posts

  scope '/api' do
    resources :posts
    resources :users do
      post '/login' => 'users#signin'
      post '/signup'=> 'users#create'
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
